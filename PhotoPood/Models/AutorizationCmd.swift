//
//  AutorizationCmd.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Протокол для реализации шаблона "Команда"
protocol AuthorizationCommand {
    /// Выполняет команду
    func execute()
}

/// Команда для показа экрана входа
class Logout: AuthorizationCommand {
    func execute() {
        TokenHandler().delete()
        Storage.deleteValue(forKey: "isAuthorized")
        UIApplication.topViewController?.dismiss(animated: true)
    }
}
