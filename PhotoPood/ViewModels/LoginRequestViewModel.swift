//
//  LoginRequestViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Поредник между моделью и представлением в рамках архитектуры MVVM
class LoginRequestViewModel {
    
    /// Запрос авторизации
    let request: URLRequest = {
        return LoginRequestHelper().getLoginRequest()
    }()
    
}
