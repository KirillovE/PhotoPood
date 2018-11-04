//
//  APIManagerViewModel.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 04/11/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

/// Класс-посредник для работы с API Instagram
class APIManagerViewModel {
    let apiManager = APIManager()
    
    func getUser(completion: @escaping (User?) -> Void) {
        apiManager.getUser(completion: completion)
    }
    
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        apiManager.getPhotos(completion: completion)
    }
    
    func search(_ tag: String, completion: @escaping ([Tag]) -> Void) {
        apiManager.search(tag, completion: completion)
    }
    
    func getPhotos(forTag tag: Tag, completion: @escaping ([Photo]) -> Void) {
        apiManager.getPhotos(forTag: tag, completion: completion)
    }
    
}
