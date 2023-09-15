//
//  MessageCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI


struct MessageCell: View {
    @State private var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack(alignment: .top){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .clipShape(Circle())
                    .padding(.leading)
                VStack(alignment: .leading) {
                    HStack{
                    Text("Uluc")
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                    
                    Text("@uluchosgelen")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                    Spacer(minLength: 0)
                    Text("11/2/2023")
                        .foregroundColor(.gray)
                        .padding(.trailing)
                    
                }
                    Text("You: How are you doing today?")
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                }
                Spacer()
                
            }
            .padding(.top, 2)
        }
        .frame(width: width, height: 84)
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
