//
//  TimeManager.swift
//  FacebookLogin
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import Foundation

enum TimeOfDay {
    case morning
    case afternoon
    case evening
    case night
    case unknown
    
    var message: String {
        switch self {
        case .morning:
            return "greeting_morning".localized
        case .afternoon:
            return "greeting_afternoon".localized
        case .evening:
            return "greeting_evening".localized
        case .night:
            return "greeting_night".localized
        default:
            return "unknown"
        }
    }
}

struct TimeManager {
    
    static func timeOfDay(for date: Date?) -> TimeOfDay {
        guard let date = date else { return .unknown }
        
        let hour = date.hour
        switch hour {
        case 6..<12:
            return .morning
        case 12..<18:
            return .afternoon
        case 18..<21:
            return .evening
        default:
            return .night
        }
    }
    
}
