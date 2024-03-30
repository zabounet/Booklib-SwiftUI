//
//  LivreDetailVie.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct LivreDetailView: View {
    
    @Binding var listeLivre: [Livres]
    @State var livre: Livres
    @State var heartImage: String
    
    @State private var counter: Int = 0
    @State private var isDeleteTapped: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            
            Spacer()
            VStack{
                HStack{
                    Image(livre.ImageLink ?? "")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 170)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    VStack(alignment: .leading, content: {
                        Text(livre.Auteur)
                            .font(.system(size: 13))
                            .fontWeight(.semibold)
                        HStack(spacing: 0){
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                            
                            Image(systemName: "star.fill")
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        Text("Collection : \(livre.Collection ?? "")")
                            .font(.system(size: 11))
                            .opacity(((livre.Collection?.isEmpty) ?? true) ? 0 : 1)
                        Spacer()
                        
                        HStack{
                            VStack(alignment: .leading){
                                Text("Sortie : " + String(livre.Annee))
                                    .font(.caption)
                                
                                Text(livre.formattedNbPages() + " pages")
                                    .font(.caption)
                            }
                            
                            Spacer()
                           
                            Image(systemName: heartImage)
                                .foregroundStyle(.accent)
                                .onTapGesture {
                                    self.counter = 0
                                    
                                    if (heartImage == "heart") {
                                        heartImage = "heart.fill"
                                    } else {
                                        heartImage = "heart"
                                    }
                                    
                                    listeLivre.forEach { livreFromList in
                                        if(livreFromList.id == livre.id){
                                            listeLivre[counter].isFavorite.toggle()
                                        }
                                        self.counter += 1
                                    }
                                }
                                .scaleEffect(1.4)
                                .padding(.trailing, 20)
                                
                        }
                    })
                    .padding(.leading, 5)
                    .frame(height: 170)
                }
                .padding()
                
                Text(livre.Description)
                    .padding()
                    .font(.system(size: 13))
            }
            
            Spacer()
            
            Button(action:{
                isDeleteTapped = true
            }, label: {
                Text("Supprimer de la bibliothèque")
                    .foregroundStyle(.red)
                    .padding(.bottom, 50)
            })
            .confirmationDialog("Voulez-vous supprimer ce livre ?", isPresented: $isDeleteTapped) {
                Button("Supprimer", role:.destructive) {
                    self.counter = 0
                    
                    listeLivre.forEach { livreFromList in
                        if(livreFromList.id == livre.id){
                            listeLivre.remove(at: counter)
                        }
                        self.counter += 1
                    }
                    dismiss()
                }
            }

            
        }
        .navigationTitle(livre.Titre)
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear{
            listeLivre = listeLivre.sorted(by: {
                $0.isFavorite && !$1.isFavorite
            })
        }
    }
}

#Preview {
    LivreDetailView(listeLivre: .constant([]), livre: Livres(
        ImageLink: "livre1", 
        Titre: "Nedim",
        Description: "Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n Descriptiodfjksdfkjbfdsbsddsjsfsfsdfdffdd ssfds sfd df s fssd ffs ddssdf sffssfdsf sfdsds ss fsfdssdf srg rs fs fd fsdsd g s sfd sdfs g g dsf ff gsrgd  sgdds gdgs fd gsgf n",
        NbPages: 256,
        Auteur: "JK",
        Annee: 2002,
        Collection: "Le seigneur des anneaux"), heartImage: "heart")
}
