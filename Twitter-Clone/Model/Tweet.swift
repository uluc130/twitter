//
//  Tweet.swift
//  Twitter-Clone
//
//  Created by Uluç Hoşgelen on 11.10.2023.
//

import Foundation


struct Tweet: Identifiable, Decodable{
    var _id: String
    var id: String{
        return _id
    }
    let test: String
    let user: String
    let username: String
    let userID: String
    let image: String?
    var likes: [String]
    var isLiked: Bool? = false
    
}
