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
        
        RequestServices.fetchData { result in
            switch result {
                case .success(let data):
                   
                do{
                    let tweets = try JSONDecoder().decode([Tweet].self, from: data!)
                       DispatchQueue.main.async {
                           self.tweets = tweets
                           
                       }
                   
                } catch let error{
                    print(error.localizedDescription)
                }
                
                
                
                
                
                case .failure(let error):
                    print(error.localizedDescription)
                    
            }
        }
        
    }
    
}
