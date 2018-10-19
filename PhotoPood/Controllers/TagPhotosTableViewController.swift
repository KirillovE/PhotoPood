//
//  TagPhotosTableViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 19/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

class TagPhotosTableViewController: UITableViewController {
    
    // MARK: - Свойства
    
    let reuseID = "PhotoTagCell"
    var photos = [Photo]()
    var tag: Tag?
    var cellHeightsCache = [IndexPath: CGFloat]()
    let apiManager = APIManager()
    
    
    // MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTagsView(with: "Paris")
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(received(_:)),
                                               name: .init(rawValue: "SelectSearchedTag"),
                                               object: nil)
        
        guard let tag = tag else { return }
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
        
        APIManager().getPhotos(forTag: tag!) { newPhotos in
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
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = cellHeightsCache[indexPath] {
            return height
        } else {
            let photo = photos[indexPath.row]
            let aspectRatio = CGFloat(photo.height) / CGFloat(photo.width)
            let photoViewHeight = tableView.frame.width * aspectRatio
            
            return ceil(photoViewHeight) + 10
        }
    }
    
}

// MARK: - Добавление представления с таблицей тегов

extension TagPhotosTableViewController {

    /// Создаёт представление с таблицей для поиска тегов
    ///
    /// - Parameter tagName: Текст для поиска тегов
    private func setTagsView(with tagName: String) {
        let tagsView = SearchedTagsView(frame: tableView.frame)

        apiManager.search(tagName) { [weak self] retrievedTags in
            tagsView.tags = retrievedTags

            DispatchQueue.main.async {
                self?.view.addSubview(tagsView)
            }
        }
    }
    
}
