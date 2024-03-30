//
//  AddLivreView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 08/03/2024.
//

import SwiftUI

enum AddLivreForm {
    case titre
    case auteur
    case annee
    case collection
    case nbPages
    case description
}

struct AddLivreView: View {
    
    @Binding var listeLivres: [Livres]
    
    @State private var titre: String = ""
    @State private var auteur: String = ""
    @State private var annee: String = ""
    @State private var collection: String = ""
    @State private var nbPages: String = ""
    @State private var description: String = ""
    
    @State private var isFormFilled: Bool = false
    @FocusState private var focusField: AddLivreForm?
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                
                Image(systemName: "camera")
                    .scaleEffect(3.5)
                    .foregroundStyle(.accent)
                    .padding(.bottom, 50)
                
                CustomInput(placeholder: "Titre", text: $titre)
                    .focused($focusField, equals: .titre)
                    .onChange(of: titre) { _, _ in
                        checkFields()
                    }
                
                CustomInput(placeholder: "Auteur", text: $auteur)
                    .focused($focusField, equals: .auteur)
                    .onChange(of: auteur) { _, _ in
                        checkFields()
                    }
                
                CustomInput(placeholder: "Année", text: $annee)
                    .focused($focusField, equals: .annee)
                    .onChange(of: annee) { _, _ in
                        checkFields()
                    }
                
                CustomInput(placeholder: "Collection", text: $collection)
                    .focused($focusField, equals: .collection)
                
                CustomInput(placeholder: "Nombre de pages", text: $nbPages)
                    .focused($focusField, equals: .nbPages)
                    .onChange(of: nbPages) { _, _ in
                        checkFields()
                    }
                
                TextField("Description", text: $description)
                    .padding()
                    .foregroundStyle(.black)
                    .frame(width: 300, height: 200, alignment: .topLeading)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.lightGrey, lineWidth: 1)
                    )
                    .padding(.top, 20)
                    .focused($focusField, equals: .description)
                    .onChange(of: description) { _, _ in
                        checkFields()
                    }
                
                Button(action: {
                    if(isFormFilled){
                        let formattedNbPages = NumberFormatter().number(from: nbPages)?.intValue ?? 0
                        let formattedAnnee = NumberFormatter().number(from: annee)?.intValue ?? 2000
                        let collectionValue = collection.isEmpty ? "" : collection
                        
                        listeLivres.append(Livres(ImageLink: "PicProfile", Titre: titre, Description: description, NbPages: formattedNbPages, Auteur: auteur, Annee: formattedAnnee, Collection: collectionValue))
                        
                        dismiss()
                    }
                }, label: {
                    Text("Enregistrer")
                })
                .buttonStyle(PrimaryBtn())
                .disabled(!isFormFilled)
                
            }
            
        }
        .navigationTitle("Ajout d'un livre")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
      
    }
    fileprivate func checkFields() {
        if(
            titre.isEmpty ||
            auteur.isEmpty ||
            annee.isEmpty ||
            nbPages.isEmpty ||
            description.isEmpty
        ) 
        {
            isFormFilled = false
        } else {
            isFormFilled = true
        }
    }
}

#Preview {
    AddLivreView(listeLivres: .constant(livres))
}
