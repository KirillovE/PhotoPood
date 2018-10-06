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
    
    /// Добавление значения в хранилище
    ///
    /// - Parameters:
    ///   - value: Значение для сохранения
    ///   - key: Ключ, для получения доступа к сохранённому значению
    static func add(_ value: Any?, forKey key: String) {
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: key)
    }
    
    /// Получение значения Булева типа
    ///
    /// - Parameter key: Ключ, по которому ищется значение
    /// - Returns: Значение Булева типа
    static func getBool(forKey key: String) -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: key)
    }
    
}
