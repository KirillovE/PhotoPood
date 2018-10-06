//
//  DelayFacade.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 06/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Фасад для системной функции Dispatch ... After
enum Delay {
    
    /// Выполняет переданное действие после указанной задержки
    ///
    /// - Parameters:
    ///   - delay: Задержка в секундах
    ///   - action: Действие для выполнения после задержки
    static func doAfter(_ delay: Double, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            action()
        }
    }

}
