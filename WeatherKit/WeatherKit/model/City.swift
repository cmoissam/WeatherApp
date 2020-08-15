//
//  City.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

/// Model Hiding the Core Data NSManaged Object from external use
@dynamicMemberLookup
public struct City {
    private let cityData: CityData

    internal init(
        cityData: CityData
    ) {
        self.cityData = cityData
    }
    public subscript<Value>(dynamicMember keyPath: KeyPath<CityData, Value>) -> Value {
        self.cityData[keyPath: keyPath]
    }
}
