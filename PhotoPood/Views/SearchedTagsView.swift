//
//  SearchedTagsView.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 19/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

/// Представление, отображающее таблицу тегов
class SearchedTagsView: UIView {
    
    var tableView: UITableView!
    var tags = [Tag]()
    let reuseID = "SearchedTagsCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настраивает табличное представление
    func configureTable() {
        self.tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: reuseID)
        self.addSubview(tableView)
    }
    
}

extension SearchedTagsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        let currentTag = tags[indexPath.row]
        
        cell.textLabel?.text = "#" + currentTag.name
        cell.detailTextLabel?.text = "\(currentTag.mediaCount)" + " фото и видео"
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .init(rawValue: "SelectSearchedTag"),
                                        object: tags[indexPath.row])
        isHidden = true
    }
    
}
