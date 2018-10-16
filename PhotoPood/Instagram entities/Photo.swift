//
//  Photo.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 12/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Даннные о фотографии
struct Photo {
    let id: String
    let user: SenderPhoto
    let url: String
    let width: Int
    let height: Int
//    let createdTime: Date
    let likesCount: Int
    let locationName: String?
    let caption: String?
    let captionSender: String?
    
    init(from container: MediaData) {
        id = container.id
        user = SenderPhoto(with: container.user)
        url = container.images.standardResolution.url
        width = container.images.standardResolution.width
        height = container.images.standardResolution.height
//        createdTime = container.createdTime
        likesCount = container.likes.count
        locationName = container.location?.name
        caption = container.caption?.text
        captionSender = container.caption?.from?.username
    }
}

/// Корневой контейнер для получения информации из JSON
struct PhotoContainer: Decodable {
    let data: [MediaData]
}

struct MediaData: Decodable {
    let id: String
    let user: User
//    let createdTime: Date
    fileprivate let images: Image
    fileprivate let likes: Likes
    fileprivate let location: Location?
    fileprivate let caption: Caption?
}

// MARK: - Вспомогательные структуры

// MARK: Структуры для изображения

private struct Image: Decodable {
    let standardResolution: StandartResolutionImage
}

private struct StandartResolutionImage: Decodable {
    let url: String
    let width, height: Int
}

// MARK: Структуры для подписи

private struct Caption: Decodable {
    let text: String?
    let from: From?
}

private struct From: Decodable {
    let username: String
}

// MARK: Остальные структуры

private struct Likes: Decodable {
    let count: Int
}

private struct Location: Decodable {
    let name: String?
}
