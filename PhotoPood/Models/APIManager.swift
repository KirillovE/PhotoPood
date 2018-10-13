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
        
        load(request) { data in
            guard let data = data else { return }
            
            let userContainer = try? JSONDecoder().decode(UserContainer.self, from: data)
            completion(userContainer?.data)
        }
    }
    
    /// Передаёт информацию о пользовательских фотографиях и видеозаписях
    ///
    /// - Parameter completion: Экземпляр класса `Photo`
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let request = requestsHelper.getUserMediaRequest() else { return }
        
        load(request) { data in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            
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
