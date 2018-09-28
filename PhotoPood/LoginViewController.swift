//
//  LoginViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import WebKit

class LoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        showLoginScreen()
    }
    
    /// Показывает экран авторизации
    private func showLoginScreen() {
        let requests = RequestHelper()
        let loginRequest = requests.getLoginRequest()
        webView.load(loginRequest)
    }
    
    /// Закрывает текущий экран при нажатии на кнопку
    ///
    /// - Parameter sender: Нажатая и отпущенная кнопка
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.stopAnimating()
    }
    
}
