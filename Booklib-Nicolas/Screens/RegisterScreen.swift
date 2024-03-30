//
//  RegisterScreen.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

enum FormFields {
    case prenom
    case nom
    case email
    case password
    case confirmPassword
}

struct RegisterScreen: View {
    
    @Binding var isLoggedIn: Bool
    
    @State private var prenom: String = ""
    @State private var nom: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @FocusState private var focusField: FormFields?
    
    @State private var isFormFilled: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Spacer()
                
                CustomInput(placeholder: "Prénom", text: $prenom)
                    .textContentType(.name)
                    .focused($focusField, equals: .prenom)
                    .onChange(of: prenom) { _, _ in
                        checkFields()
                    }
                
                
                CustomInput(placeholder: "Nom", text: $nom)
                    .textContentType(.familyName)
                    .focused($focusField, equals: .nom)
                    .onChange(of: nom) { _, _ in
                        checkFields()
                    }
                
                CustomInput(placeholder: "Email", text: $email, keyboardType: .emailAddress)
                    .textContentType(.emailAddress)
                    .focused($focusField, equals: .email)
                    .onChange(of: email) { _, _ in
                        checkFields()
                    }
                
            
                SecureField("Password", text: $password)
                    .foregroundStyle(.black)
                    .padding(8)
                    .frame(width:215)
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.lightGrey, lineWidth: 1)
                    }
                    .focused($focusField, equals: .password)
                    .onChange(of: password) { _, _ in
                        checkFields()
                    }
                
                SecureField("Confirm password", text: $confirmPassword)
                    .foregroundStyle(.black)
                    .padding(8)
                    .frame(width:215)
                    .overlay{
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.lightGrey, lineWidth: 1)
                    }
                    .focused($focusField, equals: .confirmPassword)
                    .onChange(of: confirmPassword) { _, _ in
                        checkFields()
                    }
                
                Spacer()
                
                Button {
                    if isFormFilled {
                        users.append(Utilisateurs(prenom: prenom, nom: nom, email: email, password: password))
                        isLoggedIn = true
                    
                        Session.updateValue(users.last!.nom, forKey: "nom")
                        Session.updateValue(users.last!.prenom, forKey: "prenom")
                        Session.updateValue(users.last!.email, forKey: "email")
                        Session.updateValue(users.last!.photo, forKey: "photo")
                    }
                } label: {
                    Text("Créer mon compte")
                }
                .buttonStyle(PrimaryBtn())
                .opacity(isFormFilled ? 1 : 0.6)
            }
        }.navigationTitle("Nouvel utilisateur")
    }
    
    fileprivate func checkFields() {
        if(
            prenom.isEmpty ||
            nom.isEmpty ||
            email.isEmpty ||
            password.isEmpty ||
            confirmPassword.isEmpty
        ) { isFormFilled = false }
        
        else if(password == confirmPassword){
            isFormFilled = true
        }
    }
}

#Preview {
    RegisterScreen(isLoggedIn: .constant(false))
}
