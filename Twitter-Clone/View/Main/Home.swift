//
//  Home.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct Home: View {
    let user: User
    @State private var selectedTab = 0
    @State private var showTweetView = false
    @State private var showFeed = false
    var body: some View {
        
        VStack{
            
            ZStack{
                TabView(selection: $selectedTab) {
                    Feed(user: user)
                        .tabItem {
                            if selectedTab == 0 {
                                Image("Home")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }else {
                                Image("Home")
                            }
                            
                        }.tag(0)
                        
                    SearchView()
                        .tabItem {
                            if selectedTab == 1 {
                                Image("Search")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }else {
                                Image("Search")
                            }
                        }.tag(1)
                    NotificationsView(user: user)
                        .tabItem {
                            if selectedTab == 2 {
                                Image("Notifications")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }else {
                                Image("Notifications")
                            }
                        }.tag(2)
                    MessagesView()
                        .tabItem {
                            if selectedTab == 3 {
                                Image("Messages")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("bg"))
                            }else {
                                Image("Messages")
                            }
                        }.tag(3)
                }
                
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showTweetView.toggle()
                        } label: {
                            Image("tweet")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding()
                                .background(Color("bg"))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }.padding()
                }.padding(.bottom, 65)
                    .sheet(isPresented: $showTweetView) {
                        CreateTweetView()
                    }
            }
        }
    }
}

//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//    }
//}
