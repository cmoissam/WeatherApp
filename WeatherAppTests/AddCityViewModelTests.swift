//
//  AddCityViewModelTests.swift
//  WeatherAppTests
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest
@testable import WeatherApp

class AddCityViewModelTests: XCTestCase {
    
    func testInit_shoudlReturnNil_whenNameIsNil() {
        let vm = AddCityViewModel(name: nil, longitude: "20.0", latitude: "20.0")
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlReturnNil_shoudlReturnFalse_whenNameIsEmpty() {
        let vm = AddCityViewModel(name: "", longitude: "20.0", latitude: "20.0")
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlReturnNil_whenLongitudeIsNil() {
        let vm = AddCityViewModel(name: "name", longitude: nil, latitude: "20.0")
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlReturnNil_whenLatitudeIsNil() {
        let vm = AddCityViewModel(name: "name", longitude: "20", latitude: nil)
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlReturnNil_whenLatitudeIsIncorrect() {
        let vm = AddCityViewModel(name: "name", longitude: "20", latitude: "96")
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlReturnNil_whenLongitudeIsIncorrect() {
        let vm = AddCityViewModel(name: "name", longitude: "190", latitude: "20")
        XCTAssertNil(vm)
    }
    
    func testInit_shoudlNotBeNil_whenAllValuesAreCorrect() throws {
        let vm = AddCityViewModel(name: "name", longitude: "120", latitude: "-20")
        let unwrapedVm = try XCTUnwrap(vm)
        XCTAssertEqual(unwrapedVm.name, "name")
        XCTAssertEqual(unwrapedVm.longitude, 120.0)
        XCTAssertEqual(unwrapedVm.latitude, -20.0)
    }
}
