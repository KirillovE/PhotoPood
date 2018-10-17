//
//  AuthorizationService.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Сервис для обработки выхода из учётной записи
class AuthorizationService {
    
    private let logoutCommand: AuthorizationCommand
    private let wipeAccountCommand: AuthorizationCommand
    
    /// Выход из учётной записи
    func logout() {
        logoutCommand.execute()
    }
    
    /// Стирание учётной записи с устройства
    func wipeAccount() {
        wipeAccountCommand.execute()
    }
    
    init() {
        logoutCommand = Logout()
        wipeAccountCommand = WipeAccount()
    }
    
}
