//
//  UserProfile.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 20.09.2023.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
    let user: User
    @ObservedObject var viewModel: ProfileViewModel
    
    
    
    var isCurrentUser: Bool {
        return viewModel.user.isCurrentUser ?? false
    }
    var isFollowed: Bool {
        return viewModel.user.isFollowed ?? false
    }
   
    @State private var showEditProfile = false
    
    @State private var offset: CGFloat = 0
    @State private var tabBarOffset: CGFloat = 0
    @State private var titleOffset: CGFloat = 0
    @State private var currentTab = "Tweets"
    @Namespace var animation
    var menuButtons = ["Tweets", "Tweets & Likes", "Media", "Likes"]
    
    init(user: User) {
        self.user = user
        self.viewModel = ProfileViewModel(user: user)
       
        
    }
    
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(spacing: 15) {
                    GeometryReader { proxy -> AnyView in
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        
                        return AnyView(
                            ZStack {
                                
                                
                                Image("banner")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: getRect().width, height: minY > 0 ?  180 + minY: 180, alignment: .center)
                                    .cornerRadius(0)
                                
                                BlurView()
                                    .opacity(blurViewOpacity())
                                VStack(spacing: 5) {
                                    Text(user.name)
                                        .foregroundColor(.white)
                                    Text("150 tweets \(offset)")
                                        .foregroundColor(.white)
                                }
                                .offset(y:120)
                                .offset(y: titleOffset > 100 ? 0:-getTitleOffset())
                                .opacity(titleOffset < 100 ? 1:0)
                            }
                                .clipped()
                                .frame(height: minY > 0 ? 180 + minY : nil)
                                .offset(y: minY > 0 ? -minY: -minY < 80 ? 0: -minY - 80)
                        )
                    }
                    .frame(height: 180)
                    .zIndex(1)
                    
                    VStack (alignment: .leading) {
                        HStack {
                            KFImage(URL(string: "http://localhost:3000/users/\(viewModel.user.id)/avatar"))
                                .placeholder({
                                    Image("Profile")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 75, height: 75)
                                        .clipShape(Circle())
                                })
                                .resizable()
                                .scaledToFill()
                                .frame(width: 75, height: 75)
                                .clipShape(Circle())
                                .padding(8)
                                .background(Color.white.clipShape(Circle()))
                            
                                .offset(y:offset < 0 ? getOffset() - 20 : -20)
                                .scaleEffect(getScale())
                            
                            Spacer()
                            
                            if self.isCurrentUser {
                                Button {
                                    showEditProfile.toggle()
                                } label: {
                                    Text("Edit Profile")
                                        .foregroundColor(.blue)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal)
                                        .background(Capsule().stroke(Color.blue, lineWidth: 1.5))
                                }
                                .sheet(isPresented: $showEditProfile) {
                                    
                                } content: {
                                    EditProfile(user: $viewModel.user)
                                }
                            } else {
                                if !self.isFollowed {
                                    Button {
                                        viewModel.follow()
                                       
                                    } label: {
                                        Text("Follow")
                                            .foregroundColor(.white)
                                            
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(Color.black)
                                            .clipShape(Capsule())
                                    }
                                } else {
                                    Button {
                                        viewModel.unfollow()
                                        
                                    } label: {
                                        Text("Following")
                                            .foregroundColor(.black)
                                            .padding(.vertical, 10)
                                            .padding(.horizontal)
                                            .background(Capsule().stroke(Color.black, lineWidth: 1.5))
                                    }
                                }
                            }

                            
                            
                        }
                        .padding(.top, -25)
                        .padding(.bottom, -10)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(viewModel.user.name)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            Text("@\(viewModel.user.username)")
                                .foregroundColor(.gray)
                            Text(viewModel.user.bio ?? "This is an important project that i must be completing  soon ")
                            HStack{
                                if let userLocation = viewModel.user.location {
                                    if userLocation != "" {
                                        HStack{
                                            Image(systemName: "mappin.circle.fill")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userLocation)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                if let userWebsite = viewModel.user.website {
                                    if userWebsite != "" {
                                        HStack{
                                            Image(systemName: "link")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userWebsite)
                                                .foregroundColor(Color("bg"))
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                            }
                            HStack(spacing: 5) {
                                
                                Text("\(viewModel.user.followings.count)")
                                        .fontWeight(.bold)
                                    Text(" Following")
                                        .foregroundColor(.gray)
                                
                                
                                Text("\(viewModel.user.followers.count)")
                                    .fontWeight(.bold)
                                
                                +
                                Text(" Followers")
                                    .foregroundColor(.gray)
                            }
                            
                        }
                        .overlay(
                            GeometryReader { proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    self.titleOffset = minY
                                }
                                return Color.clear
                            }
                                .frame(width: 0, height: 0), alignment: .top)
                        VStack(spacing: 0) {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack{
                                    ForEach(menuButtons, id: \.self){ button in
                                        TabButton(title: button, animation: animation, currentTab: $currentTab)
                                    }
                                }
                                
                            }
                            Divider()
                        }
                        .padding(.top, 30)
                        .background(Color.white)
                        .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                        .overlay (
                            GeometryReader { proxy -> Color in
                                let minY = proxy.frame(in: .global).minY
                                
                                DispatchQueue.main.async {
                                    tabBarOffset = minY
                                }
                                return Color.clear
                            }
                                .frame(width: 0, height: 0), alignment: .top
                        )
                        .zIndex(1)
                        VStack(spacing: 18) {
                            ForEach (viewModel.tweets) { tweet in
                                TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                            }
                        }
                       
                    }
                    .padding(.horizontal)
                    .zIndex(-offset > 80 ? 0 : 1)
                }
                
            }.toolbar(.hidden)
        }
    }
    
    func blurViewOpacity() -> Double{
        let progress = -(offset + 80) / 150
        return Double(-offset>80 ? progress: 0)
    }
    func getTitleOffset()-> CGFloat{
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress:1)
        return offset
    }
    func getOffset() -> CGFloat{
        let progress = (-offset/80) * 20
        return progress <= 20 ? progress: 20
    }
    func getScale() -> CGFloat{
        let progress = -offset/80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}

//struct UserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfile()
//    }
//}
