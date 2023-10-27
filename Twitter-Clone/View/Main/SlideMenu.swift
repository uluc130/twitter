//
//  SlideMenu.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI
import Kingfisher

struct SlideMenu: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    
    @State private var show = true
    @State private var showProfile = false
    @State private var createNewAccount = false
    @State private var width = UIScreen.main.bounds.width
    var edges = UIApplication
        .shared
        .connectedScenes
        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
        .first { $0.isKeyWindow }?.safeAreaInsets
 
    
    
    
    var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    VStack(alignment: .leading){
                        NavigationLink(destination: UserProfile(user: viewModel.currentUser!)) {
                            KFImage(URL(string: "http://localhost:3000/users/\(viewModel.currentUser!._id)/avatar"))
                                .placeholder({
                                    Image("Profile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 60, height: 60)
                                        .clipShape(Circle())
                                })
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                        
                        
                        
//                            .onTapGesture {
//                                showProfile.toggle()
//                            }
                        
                        HStack(alignment: .top, spacing: 12) {
                            VStack(alignment: .leading, spacing: 12) {
                                Text(viewModel.currentUser!.name)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                Text("@\(viewModel.currentUser!.username)")
                                    .foregroundColor(.gray)
                                HStack(spacing: 20){
                                    FollowView(count: viewModel.currentUser!.followers.count, title: "Followers")
                                    FollowView(count: viewModel.currentUser!.followings.count, title: "Following")
                                }.padding(.top, 10)
                                Divider()
                                    .padding(.top, 10)
                            
                            }
                            Spacer(minLength: 0)
                            Button {
                                withAnimation {
                                    show.toggle()
                                }
                                
                            } label: {
                                    Image(systemName: show ? "chevron.down" : "chevron.up")
                                        .foregroundColor(Color("bg"))
                                
                            }

                        }
                        VStack(alignment: .leading) {
                            ForEach(menuButtons, id: \.self){ button in
                                MenuButton(title: button)
                            }
                            Divider()
                                .padding(.top)
                            
                            Button {
                                
                            } label: {
                                MenuButton(title: "Twitter Ads")
                            }
                            Divider()
                            
                            Button {
                                viewModel.logout()
                            } label: {
                                Text("Settings and Privacy")
                                    .foregroundColor(.black)
                            }
                            .padding(.top)
                            Button {
                                
                            } label: {
                                Text("Help Center")
                                    .foregroundColor(.black)
                            }
                            .padding(.top)
                            
                            Spacer(minLength: 0)
                            
                            Divider()
                                .padding(.bottom)

                            HStack{
                                Button {
                                    
                                } label: {
                                    Image("help")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(Color("bg"))
                                }
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image("barcode")
                                        .renderingMode(.template)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(Color("bg"))
                                }


                            }
                        }
                        .opacity(show ? 1:0)
                        .frame(height: show ? nil: 0)
                        VStack(alignment: .leading){
                            Button {
                                createNewAccount.toggle()
                            } label: {
                                Text("Create new Account")
                                    .foregroundColor(Color("bg"))
                            }

                            Button {
                                
                            } label: {
                                Text("Add an existing account")
                                    .foregroundColor(Color("bg"))
                            }

                        }
    //                    .padding(.top)
                        .opacity(!show ? 1:0)
                        .frame(height: !show ? nil: 0)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, edges?.top == 0 ? 0:50)
                    .padding(.bottom, edges?.bottom == 0 ? 15: edges?.bottom)
                    .frame(width: width - 90)
                    .background(Color.white)
                    .ignoresSafeArea(.all, edges: .vertical)
                    
                    Spacer(minLength: 0)
                }
            Spacer(minLength: 0)
            }
//            .navigationDestination(isPresented: $showProfile) {
//                UserProfile(user: viewModel.currentUser!)
//            }
            .navigationDestination(isPresented: $createNewAccount) {
                WelcomeView()
        }
        }
        
    }
}

//struct SlideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenu()
//    }
//}
