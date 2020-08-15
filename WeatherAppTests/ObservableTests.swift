//
//  ObservableTests.swift
//  WeatherAppTests
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest
@testable import WeatherApp


class ObservableTests: XCTestCase {

    func test_Observable_should_fire() {
        let name = Observable<String>(value: "Name1")
        name.addObserver(fireNow: false) { name in
            XCTAssertEqual(name, "Name2")
        }
        name.value = "Name2"
    }
}
