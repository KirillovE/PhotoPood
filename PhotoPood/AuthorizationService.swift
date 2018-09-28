//
//  AuthorizationService.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

class AuthorizationService {
    let url = "https://api.instagram.com/oauth/authorize"
    let clientID = "f87757c3988945c9b5c26bba05587a89"
    let redirect = "https://instagram.com"
    
    func makeRequest() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        var urlConstructor = URLComponents()
        urlConstructor.scheme = "https"
        urlConstructor.host = "api.instagram.com"
        urlConstructor.path = "/oauth/authorize"
        urlConstructor.queryItems = [
            URLQueryItem(name: "client_id", value: clientID),
            URLQueryItem(name: "redirect_uri", value: redirect),
            URLQueryItem(name: "response_type", value: "token")
        ]
        
        _ = session.dataTask(with: urlConstructor.url!)
        
    }
    
}
