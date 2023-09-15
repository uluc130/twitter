//
//  FetchTweetsViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 12.10.2023.
//

import SwiftUI

class FetchTweetsViewModel: ObservableObject{
    @Published var tweets = [Tweet]()
    init(){
        fetchTweets()
    }
    
    func fetchTweets(){
        
        
        RequestServices.requestDomain = "http://localhost:3000/tweets"
        
        RequestServices.fetchTweets { result in
            switch result {
                case .success(let data):
                   print("success")
                do{
                    let tweets = try JSONDecoder().decode([Tweet].self, from: data!)
//                       DispatchQueue.main.async {
                           self.tweets = tweets
                           print("hello")
//                       }
                   
                } catch let error{
                    print(error.localizedDescription)
                }
                
                
                
                
                
                case .failure(let error):
                    print(error.localizedDescription)
                    print("error")
            }
        }
        
    }
    
}
