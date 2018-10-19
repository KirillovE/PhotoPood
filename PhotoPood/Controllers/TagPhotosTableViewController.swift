//
//  TagPhotosTableViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 19/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

class TagPhotosTableViewController: UITableViewController {
    
    let reuseID = "PhotoTagCell"
    var photos: [Photo] = []
    var tag: Tag!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(received(_:)),
                                               name: .init(rawValue: "SelectSearchedTag"),
                                               object: nil)
        self.title = "#" + tag.name
        loadPhotos()
    }
    
    /// Устанавливает новое значение свойству `tag`
    ///
    /// - Parameter notification: Уведомление из `NotificationCenter`
    @objc private func received(_ notification: Notification) {
        guard let tag = notification.object as? Tag else { return }
        self.tag = tag
    }
    
    /// Загружает фотографии для имеющегося тега
    private func loadPhotos() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        APIManager().getPhotos(forTag: tag) { newPhotos in
            self.photos = newPhotos
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table View Data source
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID,
                                                 for: indexPath) as! PhotoTableViewCell
        cell.set(photos[indexPath.row])
        return cell
    }
    
}
