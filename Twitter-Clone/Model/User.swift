//
//  User.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 9.10.2023.
//

import Foundation
import SwiftUI

struct ApiResponse: Decodable{
    var user: User
    var token: String
}

struct User: Decodable, Identifiable {
    
    var _id: String
    var id:String{
       return _id
    }
    var name: String
    let username: String
    let email: String
    var location: String?
//    var password: String
    var avatarExists: Bool?
    var bio: String?
    var followers: [String]
    var followings: [String]
    var tokens: [Token]
    var website: String?
    var isCurrentUser: Bool? = false
    var isFollowed: Bool? = false
//    var avatar: String?
 
    struct Token: Decodable{
        var token: String
        var _id: String
        var id:String{
           return _id
        }
    }
    
}
