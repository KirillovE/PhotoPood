//
//  AuthorizationCommand.swift
//  PhotoPood
//
//  Created by Евгений on 19/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Протокол для реализации шаблона "Команда"
protocol AuthorizationCommand {
    
    /// Выполняет команду
    func execute()

}
