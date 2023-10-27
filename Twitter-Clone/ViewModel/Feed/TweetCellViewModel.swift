//
//  TweetCellViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 16.10.2023.
//

import SwiftUI

class TweetCellViewModel: ObservableObject{
    @Published var tweet: Tweet
    @Published var user: User?
    
    init(tweet: Tweet) {
        self.tweet = tweet
        fetchUser(userId: tweet.userID)
        checkIfIsLiked()
       
    }
    
    func fetchUser(userId: String) {
        AuthServices.requestDomain = "http://localhost:3000/users/\(userId)"
        AuthServices.fetchUser() { result in
            switch result {
                case .success(let data):
                    guard let user = try? JSONDecoder().decode(User.self, from: data!) else {return}
                    DispatchQueue.main.async {
                        
                        self.user = user
                        
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    
            }
        }
    }
    
    func likeTweet(){
        
        guard let authedUser = AuthViewModel.shared.currentUser else{return}
        
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(tweet.id)/like"
        RequestServices.likingProcess { result in
//            print("liked")
//            print(result!)
        }
        RequestServices.requestDomain = "http://localhost:3000/notification"
        RequestServices.sendNotification(username: authedUser.username, notSenderId: authedUser.id, notReceiverID: self.tweet.userID, postText: "", notificationType: NotificationType.like.rawValue) { result in
            print(NotificationType.like.notificationMessage)
        }
        self.tweet.isLiked = true
    }
    func unlikeTweet(){
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(tweet.id)/unlike"
        RequestServices.likingProcess { result in
//            print("unliked")
//            print(result!)
        }
        self.tweet.isLiked = false
    }
    func checkIfIsLiked() {
        if(self.tweet.likes.contains(AuthViewModel.shared.currentUser!.id)) {
            self.tweet.isLiked = true
            
        } else {
            self.tweet.isLiked = false
        }
    }
}
