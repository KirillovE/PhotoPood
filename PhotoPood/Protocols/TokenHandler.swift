//
//  TokenHandler.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Определяет методы сохранения ключа доступа
protocol TokenHandler {
    
    /// Сохраняет ключ доступа
    ///
    /// - Parameter token: Строка, содержащая `access_token`
    func save(_ token: String)
    
    /// Выдаёт ключ доступа
    ///
    /// - Returns: Ключ доступа (`access_token`) или `nil` при его отсутствии
    func get() -> String?
    
    /// Удаляет ключ доступа из хранилища
    func delete()
    
}
