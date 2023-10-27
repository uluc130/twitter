//
//  NotificationCell.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 18.09.2023.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    let notification: Notification
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
                    KFImage(URL(string: "http://localhost:3000/\(notification.notSenderId)/avatar"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                    Text("\(notification.username)")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    +
                    Text(notification.notificationType.rawValue == "follow" ? NotificationType.follow.notificationMessage : NotificationType.like.notificationMessage)
                        .foregroundColor(.black)
                }
                Spacer(minLength: 0)
            }.padding(.leading)
            
        }
    }
}

//struct NotificationCell_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationCell()
//    }
//}
