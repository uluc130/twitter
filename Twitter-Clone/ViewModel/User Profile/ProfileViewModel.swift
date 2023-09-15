//
//  ProfileViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.10.2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    @Published var tweets = [Tweet]()
    
    init(user: User){
        self.user = user
        fetchTweets()
        checkIfCurrentUser()
        checkIfIsFollowed()
    }
    
    func fetchTweets() {
        RequestServices.requestDomain = "http://localhost:3000/tweets/\(self.user.id)"
        RequestServices.fetchTweets { result in
            switch result {
                case .success(let data):
                   print("success")
                do{
                    let tweets = try JSONDecoder().decode([Tweet].self, from: data!)
                       DispatchQueue.main.async {
                           self.tweets = tweets
                           print("hello")
                       }
                   
                } catch let error{
                    print(error.localizedDescription)
                }
                
                
                
                
                
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
            }
        }
    }
    
    public func follow () {
        RequestServices.requestDomain = "http://localhost:3000/users/follow/\(user.id)"
        RequestServices.followingProcess(id: user._id) { result in
            
            print(result)
            print("followed")
        }
        self.user.isFollowed = true
    }
    
    public func unfollow () {
        RequestServices.requestDomain = "http://localhost:3000/users/\(user.id)/unfollow"
        RequestServices.followingProcess(id: user._id) { result in
            
            print(result)
            print("unfollowed")
        }
        self.user.isFollowed = false
    }
    
    
    func checkIfCurrentUser (){
        if (self.user.id == AuthViewModel.shared.currentUser?._id) {
            self.user.isCurrentUser = true
        }
    }
    func checkIfIsFollowed(){
        if (AuthViewModel.shared.currentUser!.followings.contains(self.user.id)) {
            self.user.isFollowed = true
        }else {
            self.user.isCurrentUser = false
        }
    }
}
