//
//  ProfileDataSourceTests.swift
//  FacebookLoginTests
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import XCTest
@testable import FacebookLogin

class ProfileDataSourceTests: XCTestCase {

    var profileDataSource: ProfileDataSource?
    
    override func setUp() {
        profileDataSource = ProfileDataSource()
    }

    override func tearDown() {
        profileDataSource = nil
    }

    func testContentWithCompleteUser() {
        guard let profileDataSource = profileDataSource else {
            XCTFail("Data source cannot be nil.")
            return
        }
        
        let user = User(id: "12", name: "Ninja", email: "Test@email.com", image: "image")
        
        profileDataSource.refresh(with: user)
        
        XCTAssertNotNil(profileDataSource.user)
        XCTAssertEqual(profileDataSource.content.count, 5)
        XCTAssertEqual(profileDataSource.content[0], .image)
        XCTAssertEqual(profileDataSource.content[1], .greeting)
        XCTAssertEqual(profileDataSource.content[2], .id)
        XCTAssertEqual(profileDataSource.content[3], .email)
        XCTAssertEqual(profileDataSource.content[4], .logout)
    }
    
    func testContentWithIncompleteUser() {
        guard let profileDataSource = profileDataSource else {
            XCTFail("Data source cannot be nil.")
            return
        }
        
        let user = User(id: "12", name: "Ninja")
        
        profileDataSource.refresh(with: user)
        
        XCTAssertNotNil(profileDataSource.user)
        XCTAssertEqual(profileDataSource.content.count, 3)
        XCTAssertEqual(profileDataSource.content[0], .greeting)
        XCTAssertEqual(profileDataSource.content[1], .id)
        XCTAssertEqual(profileDataSource.content[2], .logout)
    }

}
