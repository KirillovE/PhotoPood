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
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        titleLabel.alpha = 0
        loginButton.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let animationsHelper = AnimationsHelper()
        
        animationsHelper.pullView(titleLabel, fromOutsideOf: view, withDirection: .down)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animationsHelper.pullView(self.loginButton, fromOutsideOf: self.view, withDirection: .up)
        }
    }
}
