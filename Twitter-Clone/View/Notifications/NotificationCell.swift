//
//  NotificationCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI

struct NotificationCell: View {
    @State private var width = UIScreen.main.bounds.width
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            HStack(alignment: .top) {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                VStack(alignment: .leading, spacing: 5){
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    Text("Uluc Hosgelen ")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    +
                    Text("followed you")
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
            }
            
        }
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
