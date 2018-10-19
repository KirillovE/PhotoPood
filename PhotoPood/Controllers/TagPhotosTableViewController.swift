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
        self.title = "#" + tag.name
        loadPhotos()
    }
    
    private func loadPhotos() {
        APIManager().getPhotos(forTag: tag) { newPhotos in
            self.photos = newPhotos
            DispatchQueue.main.async {
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
