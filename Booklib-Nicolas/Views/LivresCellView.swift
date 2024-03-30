//
//  LivresCellView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct LivresCellView: View {
    
    var image: String
    var titre: String
    var description: String
    var auteur: String
    var nbPages: String
    var isFavorite: Bool
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 65, height: 95)
                .clipShape(RoundedRectangle(cornerRadius: 10))

            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(titre)
                        .font(.subheadline)
                        .fontWeight(.medium)
                    
                    if(isFavorite == true){
                        Image(systemName: "heart.fill").foregroundStyle(.accent)
                    }
                }
                
                Text(description)
                    .font(.caption)
                    .fontWeight(.thin)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                
                HStack{
                    Text(auteur)
                        .font(.system(size: 15))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Text(nbPages + " pages")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
            }
        }.padding(.horizontal, 10)

    }
}


#Preview {
    LivresCellView(image: "livre2", titre: "Le kamasutra", description: "Ohlalas,fbsfkjbhsfjkshf skhs shfskfh sfskdf sdkfhdsk  fskdfhsdh s sdfhsfksdf sdkf skdhsdf sdsk hf", auteur: "Jean", nbPages: "350", isFavorite: false)
}
