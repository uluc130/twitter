//
//  Notification.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 26.10.2023.
//

import Foundation

struct Notification: Identifiable, Decodable {
    var _id : String
    var id: String {return _id}
    var notSenderId: String
    var notReceiverID: String
    var postText: String?
    var username: String
    var notificationType: NotificationType
}

enum NotificationType: String, Decodable {
    case like = "like"
    case follow = "follow"
    
    var notificationMessage: String {
        switch self{
        case .like: return " liked yot tweet"
        case .follow: return " followed you"
        }
    }
}
