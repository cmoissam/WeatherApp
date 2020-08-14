//
//  WeatherInfoService.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 14/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import CoreData

/// Enum containing errors for one call service
public enum WeatherInfoServiceError: Error {
    /// Error for duplicated name constraint on creation
    case duplicatedName
    /// Error for no data retrieved
    case noData
    /// Error for inexisting name in DataBase
    case inexistingName
}
/// Result of createNewCity service call
public enum CreateNewCityResult {
    case failure(_ error: WeatherInfoServiceError)
    case success
}
/// Result of getCityWeatherInformations service call
public enum getCityWeatherInformationsResult {
    case failure(_ error: WeatherInfoServiceError)
    /// Data is not synchronised with Api
    case local(_ city: CityData)
    /// Data is  synchronised with Api
    case remote(_ city: CityData)
}
/// Result of getAllCities service call
public enum getAllCitiesResult {
    case failure(_ error: WeatherInfoServiceError)
    case success(_ cities: CityData)
}
