//
//  LoginPage.swift
//  ChatApp
//
//  Created by Надія on 07.12.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                Picker(selection: $isLoginMode,  label: Text("Picker")) {
                    Text("Login")
                        .tag(true)
                        .font(.largeTitle)
                    Text("Create account")
                        .tag(false)
                        .font(.largeTitle)
                }
                .pickerStyle(.segmented)
                .foregroundColor(Color(uiColor: .secondarySystemBackground))
                .background(Color("Main"))
                
                                
//                Text("LOGO")
//                    .font(.largeTitle)
//                    .bold()
//                    .italic()
//                    .foregroundColor(.gray)
//
              Spacer()
                
                    VStack {
                            Text(!isLoginMode ? "Welcome!" : "Welcome back!")
                                .font(.largeTitle)
                            Text(!isLoginMode ? "We happy see you here" : "Sign in to continue")
                                .font(.caption)
                    }
                .foregroundColor(Color.white)
                            
                Spacer()
                
                Group {
                    HStack {
                        SystemImage(name: "envelope")
                        TextField("Email Address", text: $email)
                            .keyboardType(.emailAddress) // add @ to keyboard
                    }
                    .foregroundColor(.white)
                    .padding()
//                    .background(Color.mint.opacity(email == "" ? 0 : 0.2))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    
                    HStack {
                        SystemImage(name: "key")
                         SecureField("Password", text: $password)
                    }
                    .foregroundColor(.white)
                    .padding()
//                    .background(Color.mint.opacity(email == "" ? 0 : 0.2))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    
                }
                
                
                
                Button {
                    handleAction()
                } label: {
                    Text(isLoginMode ? "Sign in" : "Create account")
                        .fontWeight(.heavy)
                        .foregroundColor(Color(uiColor: .secondarySystemBackground))
                        .padding()
                        .padding(.horizontal, 40)
                        .background(
                            Capsule(style: .circular)
                                .foregroundStyle(
                                    LinearGradient(
                                        colors: [.mint, .teal],
                                        startPoint: .leading,
                                        endPoint: .trailing)
                                )
                        )
                }
                .padding(.bottom, 80)

                
            }
            .navigationTitle(isLoginMode ? "Sign in" : "Create account")
            .foregroundColor(.white)
            .background(Color("Main")

                            )
        }
    }
    
    private func handleAction() {
        if isLoginMode {
            print("Log In")
        } else {
            print("Registration...")
        }
    }
}


struct SystemImage: View {
    var name = ""
    
    var body: some View {
        Image(systemName: name)
            .font(.title2)
            .foregroundColor(Color.white.opacity(0.4))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
