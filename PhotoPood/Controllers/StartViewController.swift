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
    
    private var isAuthorized = false
    private let animationsHelper = AnimationsViewModel()
    
    // MARK: - Жизненный цикл View controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isAuthorized = Storage.getBool(forKey: "isAuthorized")
        setAppearance()
        showElementsWithAnimation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        isAuthorized = Storage.getBool(forKey: "isAuthorized")
        if isAuthorized {
            loginButton.isHidden = true
            Delay.doAfter(1) {
                self.performSegue(withIdentifier: "StartWorking", sender: self)
            }
        } else {
            loginButton.isHidden = false
            showButtonWithAnimation()
        }
    }
    
    // MARK: - Настройка внешнего вида экрана
    
    /// Настраивает внешний вид элементов представления
    private func setAppearance() {
        loginButton.layer.cornerRadius = loginButton.frame.height / 4
        titleLabel.alpha = 0
        loginButton.alpha = 0
    }
    
    /// Показывает название приложения и кнопку входа с анимацией
    private func showElementsWithAnimation() {
        animationsHelper.pullDown(animatedView: titleLabel, fromOutsideOf: view)
        
        if !isAuthorized {
            showButtonWithAnimation()
        }
    }
    
    /// Показывает кнопку с анимацией
    private func showButtonWithAnimation() {
        Delay.doAfter(0.2) {
            self.animationsHelper.pullUp(animatedView: self.loginButton,
                                         fromOutsideOf: self.view)
        }
    }
    
}
