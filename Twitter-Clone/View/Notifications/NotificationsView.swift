//
//  NotificationsView.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 15.09.2023.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        
        VStack {
            ScrollView {
                ForEach(1..<9){item in
                    NotificationCell()
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
