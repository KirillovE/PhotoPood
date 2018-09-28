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
    let needsAuthorization = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        showWithAnimation()
    }
    
    /// Настраивает внешний вид элементов представления
    fileprivate func setAppearance() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        titleLabel.alpha = 0
        loginButton.alpha = 0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !needsAuthorization {
            self.loginButton.isHidden = true
        }
    }
    
    /// Показывает название приложения и кнопку входа с анимацией
    private func showWithAnimation() {
        let animationsHelper = AnimationsHelper()
        
        animationsHelper.pullView(titleLabel, fromOutsideOf: view, withDirection: .down)
        
        if needsAuthorization {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                animationsHelper.pullView(self.loginButton, fromOutsideOf: self.view, withDirection: .up)
            }
        }
    }
    
}
