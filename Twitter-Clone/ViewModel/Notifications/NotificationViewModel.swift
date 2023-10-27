//
//  NotificationlViewModel.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.10.2023.
//

import SwiftUI


class NotificationViewModel: ObservableObject {
    
    let user: User
    @Published var notifications = [Notification]()
    
    init(user: User) {
        self.user = user
        fetchNotifications()
    }
    
    func fetchNotifications() {
        
        RequestServices.requestDomain = "http://localhost:3000/notifications/\(self.user.id)"
        RequestServices.fetchData { result in
            switch result {
                case .success(let data):
                    guard let notifications = try? JSONDecoder().decode([Notification].self, from: data!) else {return}
                    DispatchQueue.main.async {
                        self.notifications = notifications
                        
                        
                    }
                case .failure(let error):
                    print(error)
                    
            }
        }
    
    }
}
