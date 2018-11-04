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
    
    func getUser(completion: @escaping (UserViewModel?) -> Void) {
        var returnableUser: UserViewModel?
        apiManager.getUser { user in
            guard let user = user else { return }
            returnableUser = UserViewModel(from: user)
            completion(returnableUser)
        }
    }
    
    func getPhotos(completion: @escaping ([PhotoViewModel]) -> Void) {
        var returnablePhotos = [PhotoViewModel]()
        apiManager.getPhotos { photos in
            returnablePhotos = photos.map { PhotoViewModel(from: $0) }
            completion(returnablePhotos)
        }
    }
    
    func search(_ tag: String, completion: @escaping ([TagViewModel]) -> Void) {
        var returnableTags = [TagViewModel]()
        apiManager.search(tag) { tags in
            returnableTags = tags.map { TagViewModel(from: $0) }
            completion(returnableTags)
        }
    }
    
    func getPhotos(forTag tag: TagViewModel, completion: @escaping ([PhotoViewModel]) -> Void) {
        var returnablePhotos = [PhotoViewModel]()
        let tagModel: Tag = Tag(name: tag.name)
        apiManager.getPhotos(forTag: tagModel) { photos in
            returnablePhotos = photos.map { PhotoViewModel(from: $0) }
            completion(returnablePhotos)
        }
    }
    
}
