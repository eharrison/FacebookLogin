//
//  MainCoordinator.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

class MainCoordinator {
    
    static let shared: MainCoordinator = MainCoordinator()
    
    fileprivate func present(_ viewController: UIViewController, from: UIViewController) {
        if let navigationController = from as? UINavigationController {
            navigationController.pushViewController(viewController, animated: true)
            return
        }
        
        from.present(viewController, animated: true, completion: nil)
    }
}

extension UIViewController {
    static func newInstance<T: UIViewController>(_ name: String, from storyboard: String) -> T {
        let storyboard = UIStoryboard(name: storyboard, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: name) as! T
    }
}

// MARK: - Screens

extension MainCoordinator {
    
    var profile: ProfileViewController {
        return UIViewController.newInstance("ProfileViewController", from: "Profile") as! ProfileViewController
    }
    
    var login: LoginViewController {
        return UIViewController.newInstance("LoginViewController", from: "Login") as! LoginViewController
    }
}

extension UIViewController {
    
    func replaceRoot(animated: Bool = true) {
        guard let window = AppDelegate.current?.window else {
            return
        }
        
        window.rootViewController = self
        
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: { }, completion: nil)
        }
    }
    
    func present(from: UIViewController) {
        MainCoordinator.shared.present(self, from: from)
    }
    
}
