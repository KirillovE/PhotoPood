//
//  APIManager.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 12/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Класс для работы с API Instagram
class APIManager {
    
    private let requestsHelper = RequestHelper()
    
    /// Передаёт информацию о пользователе
    ///
    /// - Parameter completion: Экземпляр класса `User`
    func getUser(completion: @escaping (User?) -> Void) {
        guard let request = requestsHelper.getUserInfoRequest() else { return }
        
        let decoder = JSONDecoder()
        load(request) { data in
            guard let data = data else { return }
            
            let userContainer = try? decoder.decode(UserContainer.self, from: data)
            completion(userContainer?.data)
        }
    }
    
    /// Передаёт информацию о пользовательских фотографиях и видеозаписях
    ///
    /// - Parameter completion: Экземпляр класса `Photo`
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let request = requestsHelper.getUserMediaRequest() else { return }
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .deferredToDate
        
        load(request) { data in
            guard let data = data else { return }
            
            let photoContainer = try? JSONDecoder().decode(PhotoContainer.self, from: data)
            guard let container = photoContainer else { return }
            
            let mediaArray = container.data
            let photos = mediaArray.map { Photo(from: $0) }
            
            completion(photos)
        }
    }
    
    /// Передаёт информацию о тегах, соответствующих переданной строке
    ///
    /// - Parameters:
    ///   - tag: Строка для поиска
    ///   - completion: Массив соответствущих тегов
    func search(_ tag: String, completion: @escaping ([Tag]) -> Void) {
        guard let request = requestsHelper.getTagsRequest(for: tag) else { return }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        load(request) { data in
            guard let data = data else { return }
            
            let tagsContainer = try? decoder.decode(TagContainer.self, from: data)
            guard let container = tagsContainer else { return }
            completion(container.data)
        }
        
    }
    
    /// Передаёт фотографии, соответствующие указанному тегу
    ///
    /// - Parameters:
    ///   - tag: Тег для поиска фотографий
    ///   - comletion: Массив фотографий, соответствующих тегу
    func getPhotos(forTag tag: String, completion: @escaping ([Photo]) -> Void) {
        guard let request = requestsHelper.getPhotosRequest(withTag: tag) else { return }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .deferredToDate
        
        load(request) { data in
            guard let data = data else { return }
            
            let photoContainer = try? JSONDecoder().decode(PhotoContainer.self, from: data)
            guard let container = photoContainer else { return }
            
            let mediaArray = container.data
            let photos = mediaArray.map { Photo(from: $0) }
            
            completion(photos)
        }
    }
    
    /// Обращается в сеть по указанному запросу
    ///
    /// - Parameters:
    ///   - urlRequest: Запрос для обращения в сеть
    ///   - completion: Результат выполнения запроса
    private func load(_ urlRequest: URLRequest, completion: @escaping (Data?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: urlRequest) { (data, _, _) in
            completion(data)
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        
        task.resume()
    }
    
}
