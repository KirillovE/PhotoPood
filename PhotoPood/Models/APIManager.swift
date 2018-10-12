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
    
    /// Обращается в сеть по указанному запросу
    ///
    /// - Parameters:
    ///   - urlRequest: Запрос для обращения в сеть
    ///   - completion: Результат выполнения запроса
    private func load(_ urlRequest: URLRequest, completion: @escaping (Any?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        let task = session.dataTask(with: urlRequest) { (data, response, _) in
            print("data:\n", data ?? "empty")
            print("response:\n", response ?? "empty")
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        task.resume()
    }
    
    /// Передаёт информацию о пользователе
    ///
    /// - Parameter completion: Экземпляр класса `User`
    func getUser(completion: @escaping (User?) -> Void) {
        guard let request = requestsHelper.getUserInfoRequest() else {
            completion(nil)
            return
        }
        
        load(request) { json in
            let user = User(fromDictionary: json as! [String : Any])
            completion(user)
        }
    }
    
}
