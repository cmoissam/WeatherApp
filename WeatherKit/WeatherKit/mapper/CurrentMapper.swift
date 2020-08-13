//
//  CurrentMapper.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 13/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

public struct CurrentMapper: Decodable {
    let currentTime: Date
    let temperature: Double
    let feelsLike: Double
    let pressure: Int
    let humidity: Int
    let windSpeed: Double
    let windDegree: Int
    let weather: [WeatherMapper]

    internal enum CodingKeys: String, CodingKey {
        case currentTime = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure
        case humidity
        case windSpeed = "wind_speed"
        case windDegree = "wind_deg"
        case weather
    }
}
