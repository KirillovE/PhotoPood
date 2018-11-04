//
//  AutorizationCmd.swift
//  PhotoPood
//
//  Created by Евгений Кириллов on 17/10/2018.
//  Copyright © 2018 Триада. All rights reserved.
//

import WebKit

/// Команда для показа экрана входа
class Logout: AuthorizationCommand {
    private let tokenRemover: TokenHandler = KeychainTokenHandler()
    
    func execute() {
        tokenRemover.delete()
        Storage.deleteValue(forKey: "isAuthorized")
        UIApplication.topViewController?.dismiss(animated: true)
    }
}

/// Команда для стирания данных учётной записи с устройства
class WipeAccount: AuthorizationCommand {
    
    func execute() {
        
        let dataStore = WKWebsiteDataStore.default()
        
        dataStore.fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            let instagramRecords = records.filter {
                $0.displayName == "instagram.com"
            }
            
            dataStore.removeData(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes(), for: instagramRecords) {
                print("\n-- Данные Instagram стёрты с устройства --\n")
            }
        }
        
    }
    
}
