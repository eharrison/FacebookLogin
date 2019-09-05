//
//  SessionManager.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Foundation

class SessionManager: NSObject {
    
    static let shared: SessionManager = SessionManager()
    
    static func start() {
        shared.moveToStartPoint()
    }
    
    var currentUser: User? {
        return User.firstObject()
    }
    var isLoggedIn: Bool {
        return currentUser != nil
    }
    
    func moveToStartPoint() {
        if SessionManager.shared.isLoggedIn {
            MainCoordinator.shared.profile.replaceRoot(animated: false)
        } else {
            MainCoordinator.shared.login.replaceRoot(animated: false)
        }
    }
    
    func login(with user: User) {
        user.save()
        MainCoordinator.shared.profile.replaceRoot()
    }
    
    func logout() {
        FacebookManager.shared.logout()
        RealmManager.shared.clearDatabase()
        MainCoordinator.shared.login.replaceRoot()
    }
    
}
