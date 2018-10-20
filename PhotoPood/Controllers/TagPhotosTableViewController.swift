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
    var cellHeightsCache = [IndexPath: CGFloat]()
    var tag: Tag?
    var tagsView: SearchedTagsView!
    var photos = [Photo]()
    let apiManager = APIManager()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - Методы
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchController()
        setupTags()
    }
    
    /// Настраивает контроллер поиска
    private func setSearchController() {
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Поиск тегов..."
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    /// Настраивает работу с тегами
    private func setupTags() {
        tagsView = SearchedTagsView(frame: tableView.frame)
        view.addSubview(tagsView)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(received(_:)),
                                               name: .init(rawValue: "SelectSearchedTag"),
                                               object: nil)
    }
    
    /// Устанавливает новое значение свойству `tag`
    ///
    /// - Parameter notification: Уведомление из `NotificationCenter`
    @objc private func received(_ notification: Notification) {
        guard let tag = notification.object as? Tag else { return }
        self.tag = tag
        self.title = "#" + tag.name
        loadPhotos()
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

// MARK: - Расширения

extension TagPhotosTableViewController {

    /// Выводит представление с таблицей для поиска тегов
    ///
    /// - Parameter tagName: Текст для поиска тегов
    private func loadTags(with tagName: String) {
        
        apiManager.search(tagName) { [weak self] retrievedTags in
            self?.tagsView.tags = retrievedTags
            
            DispatchQueue.main.async {
                self?.tagsView.isHidden = false
            }
        }
    }
    
    /// Загружает фотографии для имеющегося тега
    private func loadPhotos() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        apiManager.getPhotos(forTag: tag!) { newPhotos in
            self.photos = newPhotos
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.tableView.reloadData()
            }
        }
    }
    
}

extension TagPhotosTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return  }
        loadTags(with: text)
    }
    
}
