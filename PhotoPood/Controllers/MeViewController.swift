//
//  MeViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 11/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit
import AlamofireImage

class MeViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var follows: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Свойства
    
    let apiManager = APIManager()
    var photos = [Photo]()
    
    // MARK: - Методы общего назначения
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
        loadUserInformation()
        loadPhotos()
    }
    
    /// Первоначальная настройка контроллера
    private func initialSetup() {
        avatar.layer.cornerRadius = avatar.frame.height / 2
        navigationController?.navigationBar.backgroundColor = .cyan
        table.dataSource = self
    }
    
    // MARK: - Отображение информации о пользователе
    
    /// Вызывает метод загрузки пользователя
    private func loadUserInformation() {
        activityIndicator.startAnimating()
        
        apiManager.getUser { user in
            DispatchQueue.main.async {
                self.present(user)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    /// Вызывает метод загрузки фотографий и обновляет таблицу
    private func loadPhotos() {
        activityIndicator.startAnimating()
        
        apiManager.getPhotos { photos in
            self.photos = photos
            DispatchQueue.main.async {
                self.table.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    /// Выводит на экран информацию о переданном пользователе
    ///
    /// - Parameter user: Пользователь для представления на экране
    private func present(_ user: User?) {
        guard let user = user else { return }
        
        avatar.af_setImage(withURL: URL(string: user.profilePicture)!)
        follows.text = "подписки\n" + String(user.counts?.follows ?? 0)
        followers.text = "подписчики\n" + String(user.counts?.followedBy ?? 0)
        title = "@" + user.username
    }
    
    @IBAction func exitPressed(_ sender: UIBarButtonItem) {
        let service = AuthorizationService()
        service.wipeAccount()
        service.logout()
    }
}

// MARK: - Расширение для работы с таблицей

extension MeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeTableCell") as! PhotoTableViewCell
        
        let photoURL = URL(string: photos[indexPath.row].url)
        cell.photoImageView.af_setImage(withURL: photoURL!)
        
        return cell
    }
    
}
