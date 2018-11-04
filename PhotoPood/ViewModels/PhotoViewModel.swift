//
//  PhotoViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Посредник между моделю Фото и представлением
struct PhotoViewModel {
    let id: String
    let user: SenderPhoto
    let url: String
    let width: Int
    let height: Int
    let createdTime: Date
    let likesCount: Int
    let locationName: String?
    let caption: String?
    let captionSender: String?
    
    init(from photo: Photo) {
        id = photo.id
        user = photo.user
        url = photo.url
        width = photo.width
        height = photo.height
        createdTime = photo.createdTime
        likesCount = photo.likesCount
        locationName = photo.locationName
        caption = photo.caption
        captionSender = photo.captionSender
    }
}
