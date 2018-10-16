//
//  TokenHandler.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Класс для сохранения и получения ключа доступа
class TokenHandler {
    
    /// Сохраняет ключ доступа
    ///
    /// - Parameter token: Строка, содержащая `access_token`
    func save(_ token: String) {
        Storage.add(token, forKey: "accessToken")
    }
    
    /// Выдаёт ключ доступа
    ///
    /// - Returns: Ключ доступа (`access_token`) или `nil` при его отсутствии
    func get() -> String? {
        if let accessToken = Storage.getString(forKey: "accessToken") {
            return accessToken
        } else {
            print("access_token не найден")
            return nil
        }
    }
    
}
