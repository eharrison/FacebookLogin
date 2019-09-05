//
//  AppDelegate.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 29/08/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    static var current: AppDelegate? {
        return (UIApplication.shared.delegate as? AppDelegate)
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        LibraryManager.start(application, didFinishLaunchingWithOptions: launchOptions)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return LibraryManager.application(app, open: url, options: options)
    }
    
}

