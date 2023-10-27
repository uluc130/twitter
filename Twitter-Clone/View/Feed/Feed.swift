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
        
        RefreshableScrollView {
            ScrollView(.vertical){
                VStack{
                    ForEach(viewModel.tweets){ tweet in
                        TweetCellView(viewModel: TweetCellViewModel(tweet: tweet))
                    }
                }
                .padding(.top)
                .padding(.horizontal)
                .zIndex(0)
            }
        } onRefresh: { control in
            DispatchQueue.main.async {
                viewModel.fetchTweets()
                control.endRefreshing()
            }
        }

    }
}

