//
//  DateExtensionTests.swift
//  WeatherAppTests
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    
    func test_date_default_format() {
        let date = Date(timeIntervalSince1970: 3000)
        XCTAssertEqual(date.toString(dateFormat: .defaultDateFormat), "1970-01-01/01:50:00")
    }
}
