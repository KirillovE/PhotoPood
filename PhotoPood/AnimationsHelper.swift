//
//  AnimationsHelper.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 28/09/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

enum Direction {
    case up, down
}

/// Помогает анимировать приложение
class AnimationsHelper {
    
    /// Вытягивает переданное предстваление из-за пределов экрана
    ///
    /// - Parameters:
    ///   - view: представление, которое нужно анимировать
    ///   - containerView: представление, из-за пределов которого нужно вытягивать
    ///   - direction: направление движения
    func pullView(_ view: UIView, fromOutsideOf containerView: UIView, withDirection direction: Direction) {
        let finalPositionY = view.center.y
        var initialPositionY: CGFloat = 0
        
        switch direction {
        case .down:
            initialPositionY = -view.frame.height
        case .up:
            initialPositionY = view.center.y + (containerView.bounds.height - view.frame.origin.y)
        }
        
        view.center.y = initialPositionY;
        UIView.animate(withDuration: 0.5) {
            view.center.y = finalPositionY
            view.alpha = 1
        }
    }
    
}
