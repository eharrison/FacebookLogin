//
//  LibraryManager.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

struct LibraryManager {
    
    static func start(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        RealmManager.start()
        FacebookManager.start(application, didFinishLaunchingWithOptions: launchOptions)
        SessionManager.start()
    }
    
    static func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return FacebookManager.application(app, open: url, options: options)
    }
    
}
