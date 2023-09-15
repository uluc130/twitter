//
//  MessagesView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack{
            ScrollView{
                ForEach (1..<10){item in
                    MessageCell()
                }
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
