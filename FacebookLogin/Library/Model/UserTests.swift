//
//  UserTests.swift
//  FacebookLoginTests
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import XCTest
@testable import FacebookLogin

class UserTests: XCTestCase {
    
    func testUserIsCreatedCorrectly() {
        let user = User(id: "12", name: "Ninja", email: "Test@email.com", image: "image")
        
        XCTAssertEqual(user.id, "12")
        XCTAssertEqual(user.name, "Ninja")
        XCTAssertEqual(user.email, "Test@email.com")
        XCTAssertEqual(user.image, "image")
    }
    
}
