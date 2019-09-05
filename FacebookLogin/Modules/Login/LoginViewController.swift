//
//  LoginViewController.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 29/08/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK: - Events
    
    @IBAction func loginFacebook(_ sender: Any) {
        FacebookManager.shared.login { (success) in
            if !success {
                print("Login failed")
            }
        }
    }
    
}
