//
//  LivresListView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct LivresListView: View {
    
    @Binding var listeLivres: [Livres]
    
    @State private var search = ""
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{

            List(listeLivres, id: \.id) {
                livre in
                
                if(!searchText.isEmpty && livre.Titre.contains(searchText)){
                    NavigationLink {
                        LivreDetailView(listeLivre: $listeLivres, livre: livre, heartImage: livre.isFavorite ? "heart.fill" : "heart")
                    } label: {
                        LivresCellView(
                            image: livre.ImageLink ?? "",
                            titre: livre.Titre,
                            description: livre.Description,
                            auteur: livre.Auteur,
                            nbPages: livre.formattedNbPages(),
                            isFavorite: livre.isFavorite)
                    }
                } else if(searchText.isEmpty){
                    NavigationLink {
                        LivreDetailView(listeLivre: $listeLivres, livre: livre, heartImage: livre.isFavorite ? "heart.fill" : "heart")
                    } label: {
                        LivresCellView(
                            image: livre.ImageLink ?? "",
                            titre: livre.Titre,
                            description: livre.Description,
                            auteur: livre.Auteur,
                            nbPages: livre.formattedNbPages(),
                            isFavorite: livre.isFavorite)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Mes livres")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination:{
                        AddLivreView(listeLivres: $listeLivres)
                    }, label: {
                        Image(systemName: "plus")
                    })
                    .padding(.trailing, 20)
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .searchable(text: $searchText)
    }
}

#Preview {
    LivresListView(listeLivres: .constant(livres))
}
