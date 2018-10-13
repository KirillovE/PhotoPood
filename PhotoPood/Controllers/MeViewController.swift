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

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var follows: UILabel!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let apiManager = APIManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.layer.cornerRadius = avatar.frame.height / 2
        navigationController?.navigationBar.backgroundColor = .cyan
        loadUserInformation()
    }
    
    private func loadUserInformation() {
        activityIndicator.startAnimating()
        
        apiManager.getUser { user in
            DispatchQueue.main.async {
                self.present(user)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func present(_ user: User?) {
        guard let user = user else { return }
        
        avatar.af_setImage(withURL: URL(string: user.avatarURL)!)
        follows.text = "подписки\n" + String(user.counts.follows)
        followers.text = "подписчики\n" + String(user.counts.followedBy)
        title = "@" + user.username
    }
    
}
