//
//  FacebookManager.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookManager {
    
    static let shared: FacebookManager = FacebookManager()
    
    static func start(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    static func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(app,
                                                      open: url,
                                                      sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                                                      annotation: options[UIApplication.OpenURLOptionsKey.annotation])
    }
    
    func login(from: UIViewController? = nil, completion: @escaping (Bool) -> Void) {
        #if TEST
        
        SessionManager.shared.login(with: User(id: "12312412", name: "John Smith", email: "john.smith@gmail.com", image: "https://cdn.britannica.com/79/178679-050-9170BD2A/Potala-Palace-Lhasa-China-Tibet-Autonomous-Region.jpg"))
        
        #else
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: from) { (result, error) in
            if let error = error {
                print("Error with login: \(error.localizedDescription)")
                completion(false)
            } else if result?.isCancelled ?? false {
                completion(false)
            } else {
                FacebookManager.shared.profile({ (user) in
                    if let user = user {
                        SessionManager.shared.login(with: user)
                        completion(true)
                    } else {
                        completion(false)
                    }
                })
            }
        }
        
        #endif
    }
    
    func logout() {
        let loginManager = LoginManager()
        loginManager.logOut()
    }
    
    func profile(_ completion: @escaping (User?) -> Void) {
        let request = GraphRequest(graphPath: "me", parameters: ["fields":"id, name, email, picture.type(normal)"], tokenString: AccessToken.current?.tokenString, version: nil, httpMethod: .get)
        
        request.start(completionHandler: { (connection, requestResult, error) in
            if let value = requestResult as? [String:Any] {
                do {
                    let profile: FacebookProfile? = try FacebookProfile.decode(from: value.data)
                    completion(profile?.toUser)
                } catch {
                    print(error.localizedDescription)
                }
            } else {
                completion(nil)
            }
        })
    }
}

struct FacebookProfile: Codable {
    let id: String
    let email: String
    let name: String
    let picture: FacebookPicture
    
    struct FacebookPicture: Codable {
        let data: PictureData
        
        struct PictureData: Codable {
            let url: String
        }
    }
    
    var toUser: User? {
        return User(id: id, name: name, email: email, image: picture.data.url)
    }
}
