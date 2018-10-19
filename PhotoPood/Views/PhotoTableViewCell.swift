//
//  PhotoTableViewCell.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 16/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    /// Устанавливает фотографию в ячейку
    ///
    /// - Parameter photo: Экземпляр класса `Photo`
    func set(_ photo: Photo) {
        let photoURL = URL(string: photo.url)
        photoImageView.af_setImage(withURL: photoURL!)
    }
    
}
