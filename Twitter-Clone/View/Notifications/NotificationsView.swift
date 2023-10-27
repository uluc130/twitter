//
//  NotificationsView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct NotificationsView: View {
    let user: User
    @ObservedObject var viewModel: NotificationViewModel
    
    init(user: User) {
        self.user = user
        self.viewModel = NotificationViewModel(user: user)
    }
    
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(viewModel.notifications){notification in
                    NotificationCell(notification: notification)
                }
            }
        }
    }
}

//struct NotificationsView_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationsView()
//    }
//}
