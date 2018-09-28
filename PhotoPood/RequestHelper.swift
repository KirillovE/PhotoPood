//
//  RequestHelper.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 28/09/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Помощник в создании запросов
class RequestHelper {
    
    private let apiAddress = "api.instagram.com"
    private let authPath = "/oauth/authorize"
    private let clientID = "f87757c3988945c9b5c26bba05587a89"
    private let redirectURI = "https://instagram.com"
    private let responseType = "token"
    
    /// Формирует URL-запрос на сайт instagram.com
    ///
    /// - Returns: URL-запрос для авторизации на сайте instagram.com
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
