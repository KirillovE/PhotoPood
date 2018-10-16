//
//  User.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Данные о пользователе социальной сети
struct User: Decodable {
    
    let id: String
    let username: String
    let fullName: String
    let avatarURL: String
    let bio: String?
    let webSite: String?
    let counts: Counts?
    
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case fullName = "full_name"
        case avatarURL = "profile_picture"
        case bio
        case webSite = "website"
        case counts
    }
    
}

/// Вспомогательная структура для счётчиков
struct Counts: Decodable {
    let media, follows, followedBy: Int
    
    enum CodingKeys: String, CodingKey {
        case media
        case follows
        case followedBy = "followed_by"
    }
}

/// Корневой контейнер
struct UserContainer: Decodable {
    let data: User
}