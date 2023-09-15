//
//  LoginView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.09.2023.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel: AuthViewModel

    @State private var username = ""
    @State private var password = ""
    @State private var usernameDone = false
    var body: some View {
        NavigationStack{
        if usernameDone {
            VStack {
                VStack {
                    ZStack {
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                            }
                            Spacer()
                        }
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    
                    Text("Enter your Password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    SecureAuthTextField(placeholder: "Password", text: $password)
                    
                }
                
                
                Spacer(minLength: 0)
                VStack{
                    Button {
                        self.viewModel.login(email: username, password: password)
                    } label: {
                        Text("Log in")
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("bg"))
                        
                        
                    }.clipShape(Capsule())
                        .padding(.bottom, 5)
                    Text("Forgot password?")
                        .foregroundColor(.blue)
                    
                    
                }
            }.padding(.horizontal)
                .toolbar(.hidden)
            
        }else{
            VStack {
                VStack {
                    ZStack {
                        HStack{
                            Button {
                                dismiss()
                            } label: {
                                Text("Cancel")
                            }
                            Spacer()
                        }
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                    }
                    
                    
                    
                    Text("To get started first enter your phone, email or @username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    CustomAuthTextView(placeholder: "Phone, email or @username", text: $username)
                    
                }
                
                
                Spacer(minLength: 0)
                VStack{
                    Button {
                        if !username.isEmpty{
                            usernameDone.toggle()
                            
                        }
                    } label: {
                        Text("Next")
                            .frame(width: 360, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(Color("bg"))
                        
                        
                    }.clipShape(Capsule())
                        .padding(.bottom, 5)
                    Text("Forgot password?")
                        .foregroundColor(.blue)
                    
                    
                }
            }.padding(.horizontal)
                .toolbar(.hidden)
            
        }
                
    }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
