//
//  User.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

struct User {
    let id: String
    let userName: String
    let fullName: String
    let avatarURL: String
    let bio: String
    let webSite: String
    let mediaCounts: Int
    let followsCounts: Int
    let followedByCounts: Int
    
    init(fromDictionary data: [String: Any]) {
        id = data["id"] as! String
        userName = data["username"] as! String
        fullName = data["full_name"] as! String
        avatarURL = data["profile_picture"] as! String
        bio = data["bio"] as! String
        webSite = data["website"] as! String
        
        if let counts = data["counts"] as? [String: Int] {
            mediaCounts = counts["media"]!
            followsCounts = counts["follows"]!
            followedByCounts = counts["followed_by"]!
        } else {
            mediaCounts = 0
            followsCounts = 0
            followedByCounts = 0
        }
    }
}
