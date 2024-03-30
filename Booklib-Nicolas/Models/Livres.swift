//
//  Livres.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import Foundation

struct Livres: Identifiable {
    
    let id = UUID().uuidString
    
    let ImageLink: String?
    let Titre: String
    let Description: String
    var NbPages: Int
    let Auteur: String
    let Annee: Int
    let Collection: String?
    var isFavorite: Bool = false

    init(ImageLink: String?, Titre: String, Description: String, NbPages: Int, Auteur: String, Annee: Int, Collection: String?) {
        self.ImageLink = ImageLink
        self.Titre = Titre
        self.Description = Description
        self.NbPages = NbPages
        self.Auteur = Auteur
        self.Annee = Annee
        self.Collection = Collection
    }
    
    func formattedNbPages() -> String {
        return "\(NbPages)"
    }
 
}
