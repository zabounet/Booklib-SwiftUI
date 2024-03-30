//
//  LoginView.swift
//  Booklib-Nicolas
//
//  Created by Nicolas Rabot on 06/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: Bindings
    @Binding var isLoggedIn: Bool
    
    // MARK: Etats
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Label(title: {
                    Text("Booklib")
                }, icon:{
                    Image("logo")
                })
                .labelStyle(CustomLabelStyle())
                .font(Font.custom("coiny-regular", size: 30))
                
                Spacer()
                
                VStack(spacing:5){
                    CustomInput(placeholder:"Email", text: $email, keyboardType: .emailAddress)
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                    
                    SecureField("Password", text: $password)
                        .foregroundStyle(.black)
                        .padding(8)
                        .frame(width:215)
                        .overlay{
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.lightGrey, lineWidth: 1)
                        }.padding()
                }
                
                Spacer()
                
                VStack(spacing:20){
                    
                    Button(action:{
                        users.forEach { userFromList in
                            if(userFromList.email == email.lowercased()){
                                if(userFromList.password == password){
                                    // Si les valeurs correspondent à un utilisateur
                                    // Passe isLoggedIn à true et rempli la globale
                                    // Session avec les valeur de l'utilisateur matché
                                    isLoggedIn = true
                                    
                                    Session.updateValue(userFromList.nom, forKey: "nom")
                                    Session.updateValue(userFromList.prenom, forKey: "prenom")
                                    Session.updateValue(userFromList.email, forKey: "email")
                                    Session.updateValue(userFromList.photo, forKey: "photo")
                                }
                            }
                        }
                    }, label: {
                        Text("Connexion")
                    })
                    .buttonStyle(PrimaryBtn())
                    .opacity(email.isEmpty || password.isEmpty ? 0.6 : 1)
                    
                    NavigationLink(destination: {
                        ForgotPasswordScreen()
                    }, label: {
                       Text("Mot de passe oublié ?")
                    })
                    .font(.system(size:15))
                    .foregroundStyle(.accent)
                    
                }
                
                Spacer()
                
                NavigationLink(destination: {
                    RegisterScreen(isLoggedIn: $isLoggedIn)
                }, label: {
                   Text("S'enregistrer")
                })
                .font(.system(size:15))
                .foregroundStyle(.gray)
                
                
            }.padding(.vertical, 60)
        }
        
    }
}

#Preview {
    LoginView(isLoggedIn: .constant(false))
}
