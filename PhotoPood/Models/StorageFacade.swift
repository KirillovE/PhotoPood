//
//  StorageFacade.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 06/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Фасад для системного хранилища `UserDefaults`
enum Storage {
    
    static private var defaults: UserDefaults {
        return UserDefaults.standard
    }
    
    /// Добавление значения в хранилище
    ///
    /// - Parameters:
    ///   - value: Значение для сохранения
    ///   - key: Ключ, для получения доступа к сохранённому значению
    static func add(_ value: Any?, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    /// Получение значения Булева типа
    ///
    /// - Parameter key: Ключ, по которому ищется значение
    /// - Returns: Значение Булева типа
    static func getBool(forKey key: String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    /// Получение значения строкового типа
    ///
    /// - Parameter key: Ключ, по которому ищется значение
    /// - Returns: Значение строкового типа
    static func getString(forKey key: String) -> String? {
        return defaults.string(forKey: key)
    }
    
    /// Удаляет значение из хранилища
    ///
    /// - Parameter key: Ключ, по которому ищется значение
    static func deleteValue(forKey key: String) {
        defaults.removeObject(forKey: key)
    }
    
}
