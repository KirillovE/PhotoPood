//
//  UserViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Посредник между моделью Пользователя и представлением
struct UserViewModel {
    let id: String
    let username: String
    let fullName: String
    let profilePicture: String
    let bio: String?
    let website: String?
    let counts: Counts?
    
    init(from user: User) {
        id = user.id
        username = user.username
        fullName = user.fullName
        profilePicture = user.profilePicture
        bio = user.bio
        website = user.website
        counts = user.counts
    }
}
