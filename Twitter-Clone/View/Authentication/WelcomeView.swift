//
//  WelcomeView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 25.09.2023.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack {
            VStack{
                HStack {
                    Image("Twitter")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                }
                Spacer()
                Text("See what's happening in the world right now.")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: getRect().width * 0.9, alignment: .center)
                Spacer(minLength: 0)
                
                VStack(alignment: .center, spacing: 10) {
                    Button {
                        
                        
                    } label: {
                        HStack{
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
        
                            Text("Continue with Google")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black, lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        )
                    }
                    Button {
                        
                    } label: {
                        HStack{
                            Image("apple")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            Text("Continue with Apple")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding()
                        }
                        
                    }.buttonStyle(WelcomeButton())
                    HStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width * 0.35, height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width * 0.35, height: 1)
                        
                    }
                    NavigationLink {
                        RegisterView()
                    } label: {
                        Text("Create Account")
                            .frame(width: 320, height: 60, alignment: .center)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .background(Color("bg"))
                            .clipShape(Capsule())
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    VStack() {
                        Text("By signing up, you agree to our ") + Text("Terms").foregroundColor(.blue) + Text(",") + Text(" Privacy Policy").foregroundColor(.blue) + Text(",") + Text(" Cookie Use").foregroundColor(.blue)
                    }
                    .padding(.bottom)
                    HStack(spacing:2){
                        Text("Have an account already?")
                        NavigationLink(destination: LoginView()){
                            Text("Log in")
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle("")
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
