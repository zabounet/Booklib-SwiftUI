//
//  Utilisateurs.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import Foundation

struct Utilisateurs: Identifiable {
    
    let id = UUID().uuidString
    
    let prenom: String
    let nom: String
    let email: String
    let password: String
    let photo: String = "PicProfile"
    
    init(prenom: String, nom: String, email: String, password: String) {
        self.prenom = prenom
        self.nom = nom
        self.email = email
        self.password = password
    }
}
