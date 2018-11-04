//
//  TagViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Посредник между моделью Тега и представлением
struct TagViewModel {
    let mediaCount: Int
    let name: String
    
    init(from tag: Tag) {
        mediaCount = tag.mediaCount
        name = tag.name
    }
    
    init(name: String) {
        self.name = name
        mediaCount = 0
    }
}
