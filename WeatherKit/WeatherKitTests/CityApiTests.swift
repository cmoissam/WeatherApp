//
//  CityApiTests.swift
//  WeatherKitTests
//
//  Created by Issam Lanouari on 13/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest
@testable import WeatherKit

class CityApiTests: XCTestCase {

    func test_getCityInformation_success() {
        let expectation = XCTestExpectation(description: "get city informations completion")
        let cityApi = CityApi()
        cityApi.getCityInformation(longitude: 22.0, latitude: 45.0) { cityMapper , error in
            XCTAssertNil(error)
            XCTAssertNotNil(cityMapper)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }

    func test_getCityInformation_failure() {
        let expectation = XCTestExpectation(description: "get city informations completion")
        let cityApi = CityApi()
        cityApi.getCityInformation(longitude: 8888.0, latitude: 45.0) { cityMapper , error in
            XCTAssertNil(cityMapper)
            XCTAssertEqual(error, NetworkError.serverError(400))
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
