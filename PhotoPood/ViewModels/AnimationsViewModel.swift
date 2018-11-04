//
//  AnimationsViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Посредник между моделью анимирования представления и представлением в рамках архитектуры MVVM
class AnimationsViewModel {
    /// Вытягивает наверх указанное представление
    ///
    /// - Parameters:
    ///   - animatedView: Представление, которое нужно анимировать
    ///   - containerView: Представление, из-за пределов которого нужно вытягивать `animatedView`
    func pullUp(animatedView: UIView, fromOutsideOf containerView: UIView) {
        AnimationsHelper().pullView(animatedView,
                                    fromOutsideOf: containerView,
                                    withDirection: .up)
    }
    
    /// Вытягивает вниз указанное представление
    ///
    /// - Parameters:
    ///   - animatedView: Представление, которое нужно анимировать
    ///   - containerView: Представление, из-за пределов которого нужно вытягивать `animatedView`
    func pullDown(animatedView: UIView, fromOutsideOf containerView: UIView) {
        AnimationsHelper().pullView(animatedView,
                                    fromOutsideOf: containerView,
                                    withDirection: .down)
    }
    
}
