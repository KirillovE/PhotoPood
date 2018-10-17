//
//  UIApplicationExtension.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import UIKit

extension UIApplication {
    
    /// Текущий контроллер представления
    static var topViewController: UIViewController? {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        
        return nil
    }

}
