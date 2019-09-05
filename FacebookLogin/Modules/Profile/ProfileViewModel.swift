//
//  MainViewModel.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 03/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Foundation

struct ProfileViewModel {
    
    func loadProfile(completion: @escaping (User?) -> Void) {
        completion(SessionManager.shared.currentUser)
    }
    
}
