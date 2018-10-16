//
//  LoginRequestHelper.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 16/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Помощник в формировании запроса на вход в учётную запись
class LoginRequestHelper {
    
    private let apiAddress = "api.instagram.com"
    private let authPath = "/oauth/authorize"
    private let clientID = "f87757c3988945c9b5c26bba05587a89"
    private let redirectURI = "https://instagram.com"
    private let responseType = "token"
    
    /// Формирует URL-запрос для авторизации на сайт instagram.com
    ///
    /// - Returns: URL-запрос для авторизации
    func getLoginRequest() -> URLRequest {
        
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = apiAddress
        urlContructor.path = authPath
        urlContructor.queryItems = [URLQueryItem(name: "client_id", value: clientID),
                                    URLQueryItem(name: "redirect_uri", value: redirectURI),
                                    URLQueryItem(name: "response_type", value: responseType)]
        
        return URLRequest(url: urlContructor.url!)
    }

}
