//
//  AnimationsHelper.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 28/09/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Направления движения для анимации
///
/// - up: движение вверх
/// - down: движение вниз
enum Direction {
    case up, down
}

/// Помогает анимировать приложение
class AnimationsHelper {
    
    /// Вытягивает переданное предстваление из-за пределов экрана
    ///
    /// - Parameters:
    ///   - animatedView: Представление, которое нужно анимировать
    ///   - containerView: Представление, из-за пределов которого нужно вытягивать `animatedView`
    ///   - direction: Направление движения
    func pullView(_ animatedView: UIView, fromOutsideOf containerView: UIView, withDirection direction: Direction) {
        let finalPositionY = animatedView.center.y
        var initialPositionY: CGFloat = 0
        
        switch direction {
        case .down:
            initialPositionY = -animatedView.frame.height
        case .up:
            initialPositionY = animatedView.center.y + (containerView.bounds.height - animatedView.frame.origin.y)
        }
        
        animatedView.center.y = initialPositionY;
        UIView.animate(withDuration: 0.5) {
            animatedView.center.y = finalPositionY
            animatedView.alpha = 1
        }
    }
    
}
