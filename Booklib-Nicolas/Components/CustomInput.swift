//
//  CustomInput.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct CustomInput: View {
    var placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .alphabet
    
    var body: some View {
        TextField(placeholder, text: $text)
            .foregroundStyle(.black)
            .frame(width: 200)
            .padding(8)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.lightGrey, lineWidth: 1)
            )
    }
}

#Preview {
    CustomInput(placeholder: "Input", text: .constant("Input"))
}

