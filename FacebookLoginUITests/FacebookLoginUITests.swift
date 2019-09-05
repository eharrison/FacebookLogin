//
//  FacebookLoginUITests.swift
//  FacebookLoginUITests
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import XCTest

class FacebookLoginUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    func testStartFlow() {
        let app = XCUIApplication()
        
        func testLogin() {
            XCTAssertTrue(app.staticTexts["login_title_label"].exists)
            XCTAssertTrue(app.staticTexts["login_desc_label"].exists)
            XCTAssertTrue(app.buttons["login_facebook_button"].exists)
            
            app.buttons["login_facebook_button"].tap()
            
            sleep(1)
            
            XCTAssertTrue(app.staticTexts["profile_name_label"].exists)
        }
        
        func testProfile() {
            XCTAssertTrue(app.images["profile_image"].exists)
            XCTAssertTrue(app.staticTexts["profile_greeting_label"].exists)
            XCTAssertTrue(app.staticTexts["profile_name_label"].exists)
            XCTAssertTrue(app.staticTexts["profile_id_label"].exists)
            XCTAssertTrue(app.staticTexts["profile_email_label"].exists)
            XCTAssertTrue(app.staticTexts["profile_logout_label"].exists)
            
            app.cells["profile_logout_cell"].tap()
            
            sleep(1)
            
            XCTAssertTrue(app.staticTexts["login_title_label"].exists)
        }
        
        sleep(1)
        
        if app.staticTexts["login_title_label"].exists {
            testLogin()
        } else {
            testProfile()
        }
    }

}
