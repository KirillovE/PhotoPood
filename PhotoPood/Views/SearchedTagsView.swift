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
    
    // MARK: - Свойства
    
    var tableView: UITableView!
    let reuseID = "SearchedTagsCell"
    var tags = [Tag]()
    let defaultTags = [Tag(name: "electriccars"),
                       Tag(name: "formulae"),
                       Tag(name: "bikes"),
                       Tag(name: "apple"),
                       Tag(name: "surfing"),
                       Tag(name: "snowboarding")]
    var currentTags = [Tag]()
    
    // MARK: - Методы
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        currentTags = tags.isEmpty ? defaultTags : tags
        configureTable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Настраивает табличное представление
    private func configureTable() {
        self.tableView = UITableView(frame: self.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: reuseID)
        self.addSubview(tableView)
    }
    
}

// MARK: - Работа с таблицей

extension SearchedTagsView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath)
        
        cell.textLabel?.text = "#" + currentTags[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return currentTags.count
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        NotificationCenter.default.post(name: .init(rawValue: "SelectSearchedTag"),
                                        object: currentTags[indexPath.row])
        tags.removeAll()
        isHidden = true
    }
    
}
