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
    let profilePicture: String
    let bio: String?
    let website: String?
    let counts: Counts?
    
}

/// Вспомогательная структура для счётчиков
struct Counts: Decodable {
    let media, follows, followedBy: Int
}

/// Корневой контейнер
struct UserContainer: Decodable {
    let data: User
}
