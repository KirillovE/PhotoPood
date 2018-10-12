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
    let user: User
    let url: String
    let width: Int
    let height: Int
    let createdTime: Date
    let likesCount: Int
    let locationName: String?
    let caption: String?
    let captionSender: String?
    
    init(from container: MediaData) {
        id = container.id
        user = container.user
        url = container.image.standartResolutionImage.url
        width = container.image.standartResolutionImage.width
        height = container.image.standartResolutionImage.height
        createdTime = container.createdTime
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
    let createdTime: Date
    fileprivate let image: Image
    fileprivate let likes: Likes
    fileprivate let location: Location?
    fileprivate let caption: Caption?
    
    enum CodingKeys: String, CodingKey {
        case id
        case user
        case image = "images"
        case caption
        case likes
        case createdTime = "created_time"
        case location
    }
}

// MARK: - Вспомогательные структуры

// MARK: Структуры для изображения

private struct Image: Decodable {
    let standartResolutionImage: StandartResolutionImage
    
    enum CodingKeys: String, CodingKey {
        case standartResolutionImage = "standard_resolution"
    }
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
