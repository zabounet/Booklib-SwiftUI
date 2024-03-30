//
//  ForgotPasswordScreen.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct ForgotPasswordScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var email: String = ""
    @State private var isTapped: Bool = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Text("Indiquez votre adresse e-mail :")
                    .font(.system(size: 14))
                    .padding(.bottom, 5)
                
                CustomInput(placeholder: "e-mail", text: $email, keyboardType: .emailAddress)
                    .keyboardType(.emailAddress)
                    .padding(.bottom, 30)
                
                Button( action:{
                    isTapped = true
                }, label:{
                    Text("Valider")
                })
                .alert(isPresented: $isTapped) {
                    Alert(title: Text("Confirmation"), message: Text("Vous allez recevoir une procédure de réinitialisation de mot de passe à l'adresse indiquée"), dismissButton: .default(Text("OK"), action: {
                        dismiss()
                    }))
                }
                .buttonStyle(PrimaryBtn())
                .opacity(email.isEmpty ? 0.6 : 1)
                .disabled(email.isEmpty)
                
                // La vilaine bidouille pour ressembler à la maquette
                
                Spacer()
            }
            .padding(.top, 100)
        }.navigationTitle("Mot de passe oublié")
    }
}

#Preview {
    ForgotPasswordScreen()
}
