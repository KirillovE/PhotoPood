//
//  EndpointRequestsHelper.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 28/09/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Помощник в создании запросов к API Endpoints
class EndpointRequestsHelper {
    
    private let apiAddress = "api.instagram.com"
    private let endPointsPath = "/v1"    
    
    /// Формирует URL-запрос для получения информации об авторизованном пользователе
    ///
    /// - Returns: URL-запрос для получения пользователя
    func getUserInfoRequest() -> URLRequest? {
        return getRequest(path: "/users/self")
    }
    
    /// Формирует URL-запрос для получения информации о последних фото/видео пользователя
    ///
    /// - Returns: URL-запрос для получения фото/видео
    func getUserMediaRequest() -> URLRequest? {
        return getRequest(path: "/users/self/media/recent")
    }
    
    /// Формирует URL-запрос для получения информации о тегах
    ///
    /// - Parameter tag: Тег, который нужно найти
    /// - Returns: URL-запрос для получения тегов
    func getTagsRequest(forTag tag: String) -> URLRequest? {
        let tagQuery = URLQueryItem(name: "q", value: tag)
        return getRequest(path: "/tags/search", queries: [tagQuery])
    }
    
    /// Формирует URL-запрос для получения фотографий, соответствующих тегу
    ///
    /// - Parameter tag: Строка для поиска фотографий
    /// - Returns: URL-запрос для получения фотографий
    func getPhotosRequest(forTag tag: String) -> URLRequest? {
        return getRequest(path: "/tags/" + tag + "/media/recent")
    }
    
    /// Создаёт запрос на получение информации от API Instagram
    ///
    /// - Parameters:
    ///   - path: Путь к методу API
    ///   - queries: Параметры запроса
    /// - Returns: Сформированный URL-запрос
    private func getRequest(path: String,
                            queries: [URLQueryItem] = [URLQueryItem]()) -> URLRequest? {
        
        guard let token = TokenHandler().get() else {
            print("===\n --- нет сохранённого access_token --- \n=== \n")
            return nil
        }
        
        var urlContructor = URLComponents()
        urlContructor.scheme = "https"
        urlContructor.host = apiAddress
        urlContructor.path = endPointsPath + path
        urlContructor.queryItems = [URLQueryItem(name: "access_token", value: token)]
        urlContructor.queryItems?.append(contentsOf: queries)
        
        return URLRequest(url: urlContructor.url!)
        
    }
    
}
