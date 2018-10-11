//
//  MeViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 11/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var followers: UILabel!
    @IBOutlet weak var follows: UILabel!
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
}
