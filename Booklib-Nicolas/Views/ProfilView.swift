//
//  ProfilView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 07/03/2024.
//

import SwiftUI

struct ProfilView: View {
    
    @Binding var listeLivres: [Livres]
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    VStack{
                        Image(Session["photo"] ?? "PicProfile")
                    }
                    VStack(alignment: .leading){
                        Text("\(Session["prenom"] ?? "") \(Session["nom"] ?? "")")
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text(Session["email"] ?? "")
                            .font(.caption)
                            .opacity(0.4)
                        Text("Membre depuis mars 2022")
                            .font(.system(size: 9))
                            .italic()
                            .fontWeight(.semibold)
                            .padding(.top, 1)
                    }
                    .padding(.horizontal, 15)
                    VStack{
                        Spacer()
                        Text("Livres en stock : \(listeLivres.count)")
                            .font(.system(size: 10))
                            .fontWeight(.semibold)
                            .padding(.bottom, 10)
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 100)
                .background(.lightGrey)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .padding(.vertical, 40)
                
                Button(action:{
                    isLoggedIn = false
                    Session.removeAll()
                }, label:{
                    Text("Deconnexion")
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                })
                .padding(.horizontal, 25)
                .padding(.vertical, 15)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                
            }
            .navigationTitle("Mon compte")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProfilView(listeLivres: .constant(livres), isLoggedIn: .constant(true))
}
