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
    private let endPointsPath = "/v1"
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
    
    /// Формирует URL-запрос для получения информации об авторизованном пользователе
    ///
    /// - Returns: URL-запрос для получения пользователя
    func getUserInfoRequest() -> URLRequest? {
        guard let token = getAccessToken() else {
            return nil
        }
        
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = apiAddress
        urlContructor.path = endPointsPath + "/users/self"
        urlContructor.queryItems = [URLQueryItem(name: "access_token", value: token)]
        
        return URLRequest(url: urlContructor.url!)
    }
    
    /// Достаёт из хранилища access_token
    ///
    /// - Returns: `access_token` при его наличии, `nil` при отсутствии
    private func getAccessToken() -> String? {
        if let accessToken = Storage.getString(forKey: "accessToken") {
            return accessToken
        } else {
            print("access_token не найден")
            return nil
        }
    }
    
}
