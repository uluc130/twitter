//
//  Feed.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct Feed: View {
    let user: User
    @ObservedObject var viewModel = FetchTweetsViewModel()
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack{
               
                    ForEach(viewModel.tweets){ tweet in
                        
                        TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                        
                        
                    }
               
                
                
//                TweetCellView(tweetImage: "post", tweet: "Hey Tim, are those regular glasses?")
//
//                Divider()
//                ForEach (1..<9){ item in
//                    TweetCellView(tweet: sampleText)
//                    Divider()
//                }
            }
            .padding(.top)
            .padding(.horizontal)
            .zIndex(0)
        }
    }
}

//struct Feed_Previews: PreviewProvider {
//    static var previews: some View {
//        Feed()
//    }
//}
