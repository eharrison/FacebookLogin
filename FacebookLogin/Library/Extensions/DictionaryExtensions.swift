//
//  DictionaryExtensions.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 05/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Foundation

extension Dictionary {
    
    var data: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
    
}
