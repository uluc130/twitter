//
//  SearchCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct SearchCell: View {
    
    var tweets = ""
    var tag = ""
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing:5) {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    .fontWeight(.heavy)
                Text(tweets + " Tweets")
                .fontWeight(.light)
                
                
            }
            Spacer()
        }
        .padding(.leading)
        .padding(.bottom, 10)
        
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell()
    }
}
