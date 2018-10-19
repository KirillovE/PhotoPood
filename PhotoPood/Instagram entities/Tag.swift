//
//  Tag.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 12/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Данные о теге
struct Tag: Decodable {
    let mediaCount: Int
    let name: String
    
    /// Создаёт экземпляр тега-заглушки со значением счётчика "0"
    ///
    /// - Parameter name: Имя тега
    init(name: String) {
        self.name = name
        mediaCount = 0
    }
}

/// Корневой контейнер
struct TagContainer: Decodable {
    let data: [Tag]
}
