//
//  CityMapper.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 13/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

public struct CityMapper: Decodable {
    let timeZone: String
    let latitude: Double
    let longitude: Double
    let currentWeather: CurrentMapper

    internal enum CodingKeys: String, CodingKey {
        case currentWeather = "current"
        case timeZone = "timezone"
        case latitude = "lat"
        case longitude = "lon"
    }
}
