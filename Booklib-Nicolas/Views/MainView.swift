//
//  ContentView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct MainView: View {
    
    // MARK: Etats
    @State private var isLoggedIn = false
    @State private var listeLivres = livres
    
    var body: some View {
        // Si l'utilisateur est loggé, affiche la page d'accueil du site.
        // Sinon, affiche la page de connexion.
        if(isLoggedIn){
            TabView{
                Group{
                    LivresListView(listeLivres: $listeLivres)
                        .tabItem { Label("Mes livres", systemImage: "list.dash") }
                    ProfilView(listeLivres: $listeLivres, isLoggedIn: $isLoggedIn)
                        .tabItem { Label("Compte ", systemImage: "person.fill") }
                }
                .toolbarBackground(.accent, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .toolbarColorScheme(.dark, for: .tabBar)
                
            }
            
        } else {
            NavigationStack{
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    MainView()
}
