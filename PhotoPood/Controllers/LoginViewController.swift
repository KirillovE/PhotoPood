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
    var tokenSaver: TokenHandler!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenSaver = KeychainTokenHandler()
        webView.navigationDelegate = self
        showLoginScreen()
    }
    
    // MARK: - Работа с экраном авторизации
    
    /// Показывает экран авторизации
    private func showLoginScreen() {
        let loginRequestHelper = LoginRequestHelper()
        let loginRequest = loginRequestHelper.getLoginRequest()
        webView.load(loginRequest)
    }
    
    /// Закрывает текущий экран при нажатии на кнопку
    ///
    /// - Parameter sender: Нажатая и отпущенная кнопка
    @IBAction func cancelButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - Методы Navigation delegate

extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 didStartProvisionalNavigation navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webView(_ webView: WKWebView,
                 didFinish navigation: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        activityIndicator.stopAnimating()
    }
        
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationAction: WKNavigationAction,
                 decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let urlString = navigationAction.request.url?.absoluteString,
            urlString.range(of: "access_token") != nil {
            
            let accessToken = urlString.components(separatedBy: "#access_token=").last!
            Storage.add(true, forKey: "isAuthorized")
            tokenSaver.save(accessToken)
            
            decisionHandler(.cancel)
            dismiss(animated: true, completion: nil)
            
        } else {
            decisionHandler(.allow)
        }
        
    }
    
}
