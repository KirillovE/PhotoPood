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
    
    private let requestsHelper = EndpointRequestsHelper()
    private let loader = Loader()
    private let decoder: JSONDecoder = {
        let decdr = JSONDecoder()
        decdr.keyDecodingStrategy = .convertFromSnakeCase
        decdr.dateDecodingStrategy = .custom { dateDecoder -> Date in
            let container = try dateDecoder.singleValueContainer()
            let dateNumber = try container.decode(String.self)
            return Date(timeIntervalSince1970: Double(dateNumber) ?? 0)
        }
        return decdr
    }()
    
    /// Передаёт информацию о пользователе
    ///
    /// - Parameter completion: Экземпляр класса `User`
    func getUser(completion: @escaping (User?) -> Void) {
        guard let request = requestsHelper.getUserInfoRequest() else { return }
        
        loader.execute(request) { [weak self] data in
            guard let data = data else { return }
            
            do {
                let userContainer = try self?.decoder.decode(UserContainer.self, from: data)
                completion(userContainer?.data)
            } catch {
                completion(nil)
            }
        }
    }
    
    /// Передаёт информацию о пользовательских фотографиях и видеозаписях
    ///
    /// - Parameter completion: Экземпляр класса `Photo`
    func getPhotos(completion: @escaping ([Photo]) -> Void) {
        guard let request = requestsHelper.getUserMediaRequest() else { return }
        
        loader.execute(request) { [weak self] data in
            guard let data = data else { return }
            
            do {
                let photoContainer = try self?.decoder.decode(PhotoContainer.self, from: data)
                guard let container = photoContainer else { return }
                
                let mediaArray = container.data
                let photos = mediaArray.map { Photo(from: $0) }
                
                completion(photos)
            } catch {
                completion([Photo]())
            }
        }
    }
    
    /// Передаёт информацию о тегах, соответствующих переданной строке
    ///
    /// - Parameters:
    ///   - tag: Строка для поиска
    ///   - completion: Массив соответствущих тегов
    func search(_ tag: String, completion: @escaping ([Tag]) -> Void) {
        guard let request = requestsHelper.getTagsRequest(forTag: tag) else { return }
        
        loader.execute(request) { [weak self] data in
            guard let data = data else { return }
            
            do {
                let tagsContainer = try self?.decoder.decode(TagContainer.self, from: data)
                guard let container = tagsContainer else { return }
                completion(container.data)
            } catch {
                completion([Tag]())
            }
        }
    }
    
    /// Передаёт фотографии, соответствующие указанному тегу
    ///
    /// - Parameters:
    ///   - tag: Тег для поиска фотографий
    ///   - comletion: Массив фотографий, соответствующих тегу
    func getPhotos(forTag tag: String, completion: @escaping ([Photo]) -> Void) {
        guard let request = requestsHelper.getPhotosRequest(forTag: tag) else { return }
        
        loader.execute(request) { [weak self] data in
            guard let data = data else { return }
            
            do {
                let photoContainer = try self?.decoder.decode(PhotoContainer.self, from: data)
                guard let container = photoContainer else { return }
                
                let mediaArray = container.data
                let photos = mediaArray.map { Photo(from: $0) }
                
                completion(photos)
            } catch {
                completion([Photo]())
            }
        }
    }
    
}
