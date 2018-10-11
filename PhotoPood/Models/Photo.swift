//
//  Photo.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 12/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation

/// Данные о фотографии
struct Photo {
    
    let id: String
    let user: User
    let width: Int
    let height: Int
    let url: String
    let created_time: Date
    let likes_count: Int
    let location_name: String?
    let caption: String?
    let captionSender: String?
    
    init(response: [String: Any]) {
        id = response["id"] as! String
        user = User(fromDictionary: response["user"] as! [String: Any])
        
        let image = (response["images"] as!
            [String: Any])["standard_resolution"] as! [String: Any]
        
        width = image["width"] as! Int
        height = image["height"] as! Int
        url = image["url"] as! String
        
        created_time = Date(timeIntervalSince1970:
            Double(response["created_time"] as! String)!)
        
        likes_count = (response["likes"] as! [String:Any])["count"] as! Int
        
        location_name = (response["location"] as?
            [String:Any])?["name"] as? String
        
        caption = (response["caption"] as? [String:Any])?["text"] as? String
        
        captionSender = ((response["caption"] as? [String:Any])?["from"]
            as? [String:Any])?["username"] as? String
    }
    
}

