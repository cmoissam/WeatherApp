//
//  CityDetailsViewModel.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import UIKit
import WeatherKit

enum CityDetailsDisplayContext {
    case loading(String)
    case noData
    case success(CityDetailsViewModel)
}

class CityDetailsViewModel {
    
    public let latitude: String
    public let longitude: String
    public let name: String?
    public let timeZone: String?
    public let currentTime: String?
    public let temperature: String
    public let feelsLike: String
    public let pressure: String
    public let humidity: String
    public let windSpeed: String
    public let windDegree: String
    public let weatherMain: String?
    public let weatherDescription: String?
    public let weatherIcon: UIImage?
    public let isRemote: Bool
    
    init(city: City, isRemote: Bool) {
        self.latitude = "\(city.latitude)"
        self.longitude = "\(city.longitude)"
        self.name = city.name
        self.timeZone = city.timeZone
        self.currentTime = city.currentTime?.toString(dateFormat: .defaultDateFormat)
        self.temperature = String(format: "%.2f °C", city.temperature-273.15)
        self.feelsLike = String(format: "%.2f °C", city.feelsLike-273.15)
        self.pressure = "\(city.pressure) hPa"
        self.humidity = "\(city.humidity) %"
        self.windSpeed = "\(city.windSpeed) m/s"
        self.windDegree = "\(city.windDegree) °"
        self.weatherMain = city.weatherMain
        self.weatherDescription = city.weatherDescription
        self.weatherIcon = UIImage(named: city.weatherIconPath ?? "")
        self.isRemote = isRemote
    }
}
