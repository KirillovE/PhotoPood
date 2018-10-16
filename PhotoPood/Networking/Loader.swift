//
//  Loader.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Загрузчик результатов запросов
class Loader {
    
    /// Обращается в сеть по указанному запросу
    ///
    /// - Parameters:
    ///   - urlRequest: Запрос для обращения в сеть
    ///   - completion: Результат выполнения запроса
    func execute(_ urlRequest: URLRequest, completion: @escaping (Data?) -> Void) {
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
