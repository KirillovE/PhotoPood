//
//  SenderPhoto.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 16/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

protocol UserPhoto {
    var username: String { get }
    var pictureURL: String { get }
}

/// Заместитель для класса `User`
class SenderPhoto: UserPhoto {
    let owner: User
    
    var username: String {
        return owner.username
    }
    
    var pictureURL: String {
        return owner.profilePicture
    }
    
    init(with user: User) {
        owner = user
    }
    
}
