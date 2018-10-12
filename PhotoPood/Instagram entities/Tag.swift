//
//  Tag.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 12/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

class Tag {
    
    let media_count: Int
    let name: String
    
    init(response: [String:Any]) {
        media_count = response["media_count"] as! Int
        name = response["name"] as! String
    }
    
}
