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
                
                .padding(10)
                                
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
                .foregroundColor(Color.primary)
                            
//                            Button {
//
//                            } label: {
//                                Image(systemName: "person")
//                                    .resizable()
//                                    .frame(width: 50, height: 50)
//                                    .padding()
//                                    .foregroundColor(.teal.opacity(0.5))
//                                    .background(
//                                        RoundedRectangle(cornerRadius: 5)
//                                            .stroke(lineWidth: 3)
//                                    )
//                            }
//                            .foregroundColor(.gray.opacity(0.5))
        //                    .foregroundStyle(
        //                        LinearGradient(
        //                            colors: [.mint, .teal],
        //                            startPoint: .leading,
        //                            endPoint: .trailing)
        //                    )
                        
                
                Spacer()
                
                Group {
                    HStack {
                        SystemImage(name: "envelope")
                        TextField("Email Address", text: $email)
                            .keyboardType(.emailAddress) // add @ to keyboard
                    }
                    .padding()
                    .background(Color.teal.opacity(email == "" ? 0 : 0.2))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    
                    HStack {
                        SystemImage(name: "key")
                         SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.teal.opacity(password == "" ? 0 : 0.2))
                    .cornerRadius(5)
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                    
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
            .background(
                LinearGradient(
                    colors: [.teal.opacity(0.3), .white],
                    startPoint: .bottom,
                    endPoint: .top)
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
            .foregroundColor(Color.primary.opacity(0.7))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
