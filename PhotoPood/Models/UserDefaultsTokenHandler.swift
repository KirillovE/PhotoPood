//
//  UserDefaultsTokenHandler.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Работа с ключом доступа через хранилище `UserDefaults`
class UserDefaultsTokenHandler: TokenHandler {
    
    func save(_ token: String) {
        Storage.add(token, forKey: "accessToken")
    }
    
    func get() -> String? {
        if let accessToken = Storage.getString(forKey: "accessToken") {
            return accessToken
        } else {
            print("===\n --- access_token не найден --- \n=== \n")
            return nil
        }
    }
    
    func delete() {
        Storage.deleteValue(forKey: "accessToken")
    }
    
}
