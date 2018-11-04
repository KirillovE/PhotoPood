//
//  KeychainTokenHandler.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import SwiftKeychainWrapper

/// Работа с ключом доступа через хранилище `Keychain`
class KeychainTokenHandler: TokenHandler {
    
    func save(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: "AccessToken")
    }
    
    func get() -> String? {
        return KeychainWrapper.standard.string(forKey: "AccessToken")
    }
    
    func delete() {
        KeychainWrapper.standard.removeObject(forKey: "AccessToken")
    }
    
}
