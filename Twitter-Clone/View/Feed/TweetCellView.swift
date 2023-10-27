//
//  TweetCellView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    
    @ObservedObject var viewModel:TweetCellViewModel
    @State private var showProfile = false
    
    var isLiked: Bool {
        return viewModel.tweet.isLiked ?? false
    }
    
    init(viewModel: TweetCellViewModel) {
        self.viewModel = viewModel
        
    }
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 10) {
                
                if let user = viewModel.user {
                    NavigationLink {
                        UserProfile(user: user)
                    } label: {
                        
                            KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.tweet.userID)/avatar"))
                            .placeholder({
                                Image("Profile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .clipShape(Circle())
                            })
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                    }
                }

                VStack (alignment: .leading, spacing: 10){
                    Text(self.viewModel.tweet.username)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    +
                    Text("@\(self.viewModel.tweet.username)")
                        .foregroundColor(.gray)
                    Text(self.viewModel.tweet.test)
                        .frame(maxHeight: 100, alignment: .top)
                    
                    if viewModel.tweet.image == "true" {
                       
                        GeometryReader { proxy in
                            KFImage(URL(string: "http://localhost:3000/viewTweetImage/\(viewModel.tweet.id)"))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: proxy.frame(in: .global).width, height: 250)
                                .cornerRadius(15)
                        }.frame(height: 250)
                    }
                    
                    
                }
                Spacer()
            }
            HStack(spacing: 50) {
                
                Button {
                    
                } label: {
                    Image("Comments").resizable().frame(width: 16, height: 16).foregroundColor(.gray)
                }
                Button {
                    
                } label: {
                    Image("Retweet").resizable().frame(width: 18, height: 14).foregroundColor(.gray)
                }
                Button {
                    !self.isLiked ? self.viewModel.likeTweet(): self.viewModel.unlikeTweet()
                } label: {
                    if !self.isLiked {
                        Image("love").resizable().frame(width: 18, height: 15).foregroundColor(.gray)
                    }else{
                        Image("love").resizable().renderingMode(.template).foregroundColor(.red).frame(width: 18, height: 15)
                    }
                }
                Button {
                    
                } label: {
                    Image("upload").resizable().renderingMode(.template) .frame(width: 18, height: 15).foregroundColor(.gray)
                }


            }.padding(.top, 4)
                
           
        }
        
    }
    
}

//struct TweetCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetCellView(tweetImage: "post", tweet: sampleText)
//    }
//}
var sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
