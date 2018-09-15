//
//  StartViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientToBackgound()
    }
    
    private func addGradientToBackgound() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.cyan.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }

}
