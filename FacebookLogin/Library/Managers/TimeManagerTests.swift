//
//  TimeManagerTests.swift
//  FacebookLoginTests
//
//  Created by Evandro Harrison Hoffmann on 04/09/2019.
//  Copyright © 2019 It's Day Off. All rights reserved.
//

import XCTest
@testable import FacebookLogin

class TimeManagerTests: XCTestCase {

    func testTimeIsCorrect() {
        XCTAssertEqual(TimeManager.timeOfDay(for: "08:00".date(withFormat: "HH:mm")), .morning)
        XCTAssertNotEqual(TimeManager.timeOfDay(for: "05:00".date(withFormat: "HH:mm")), .morning)
        XCTAssertEqual(TimeManager.timeOfDay(for: "05:00".date(withFormat: "HH:mm")), .night)
        XCTAssertEqual(TimeManager.timeOfDay(for: "07:54".date(withFormat: "HH:mm")), .morning)
        XCTAssertEqual(TimeManager.timeOfDay(for: "17:54".date(withFormat: "HH:mm")), .afternoon)
        XCTAssertEqual(TimeManager.timeOfDay(for: "18:00".date(withFormat: "HH:mm")), .evening)
        XCTAssertEqual(TimeManager.timeOfDay(for: "20:59".date(withFormat: "HH:mm")), .evening)
        XCTAssertEqual(TimeManager.timeOfDay(for: "21:00".date(withFormat: "HH:mm")), .night)
    }
    
    func testGreetingIsCorrect() {
        XCTAssertEqual(TimeOfDay.morning.message, "greeting_morning".localized)
        XCTAssertEqual(TimeOfDay.afternoon.message, "greeting_afternoon".localized)
        XCTAssertEqual(TimeOfDay.evening.message, "greeting_evening".localized)
        XCTAssertEqual(TimeOfDay.night.message, "greeting_night".localized)
    }

}
