//
//  LoginViewController.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 15.09.2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import Foundation
import WebKit

class LoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requests = RequestHelper()
        let loginRequest = requests.getLoginRequest()
        webView.load(loginRequest)
    }


}
