//
//  PrimaryBtn.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct PrimaryBtn: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
       
        configuration.label
            .foregroundStyle(.white)
            .padding(.horizontal, 70)
            .padding(.vertical, 10)
            .background(
                Color.accentColor
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            )
            .font(.system(size: 20))
            .fontWeight(.semibold)
    }
}

struct CustomLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
        }
    }
}
