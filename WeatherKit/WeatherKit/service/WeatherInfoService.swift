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
    case local(_ city: City)
    /// Data is  synchronised with Api
    case remote(_ city: City)
}
/// Result of getAllCities service call
public enum getAllCitiesResult {
    case failure(_ error: WeatherInfoServiceError)
    case success(_ cities: [City])
}

/// Service of weather information for given coordinates
/// Data is collected from  Api: [https://api.openweathermap.org/data/2.5/onecall]
public class WeatherInfoService {
    private let cityDataManger: CityDataManger
    private let cityApi: CityApi
    
    public init() {
        self.cityDataManger = CityDataManger()
        self.cityApi = CityApi()
    }

    // This is for Test purpose
    internal init(
        _ persistentContainer: NSPersistentContainer
    ) {
        self.cityDataManger = CityDataManger(persistentContainer)
        self.cityApi = CityApi()
    }
    
    /// createNewCity: create new City on DataBase
    /// - Parameter name: name of city to create
    /// - Parameter longitude: longitude coordinate of city to create
    /// - Parameter latitude: latitude coordinate of city to create
    /// - Parameter completion: The completion block that is executed when the service finishes.
    ///
    public func createNewCity(
        name: String,
        longitude: Double,
        latitude: Double,
        completion: @escaping (CreateNewCityResult) -> Void
    ) {
        do {
            try cityDataManger.createCityData(name: name, longitude: longitude, latitude: latitude)
            completion(.success)
        } catch {
            completion(.failure(.duplicatedName))
        }
    }

    /// getCityWeatherInformations: get weather inbformations of city
    /// Parameters :
    /// - Parameter name: name of requested city infoirlmation
    /// - Parameter completion: The completion block that is executed when the service finishes.
    ///
    public func getCityWeatherInformations(
        name: String,
        completion: @escaping (getCityWeatherInformationsResult) -> Void
    ) {
        do {
            let savedCity = try cityDataManger.getCity(with: name)
            guard let safeSavedCity = savedCity else {
                completion(.failure(.inexistingName))
                return
            }
            cityApi.getCityInformation(
            longitude: safeSavedCity.longitude,
            latitude: safeSavedCity.latitude
            ) { city, error in
                do {
                    if let error = error {
                        switch error {
                        case .noNetwork, .requestTimedOut, .noDataReceived:
                            print(error.localizedDescription)
                        default:
                            fatalError("Server request failed with Error\(error.localizedDescription)")
                        }
                    }
                    if let safeCity = city {
                        guard let newCity = try self.cityDataManger.updateCityData(name: name, city: safeCity)
                            else {
                                completion(.failure(.inexistingName))
                                return
                            }
                        completion(.remote(City(cityData: newCity)))
                    } else {
                        safeSavedCity.filled ? completion(.local(City(cityData: safeSavedCity))) : completion(.failure(.noData))
                    }
                } catch {
                    completion(.failure(.inexistingName))
                }
            }
        } catch {
            completion(.failure(.inexistingName))
        }
    }

    /// getAllCities: get all  cities stored in DataBase
    /// - Parameter completion: The completion block that is executed when the service finishes.
    ///
    public func getAllCities(
        completion: @escaping (getAllCitiesResult) -> Void
    ) {
        do {
            let cities = try cityDataManger.getAllCities().map({ City(cityData: $0) })
            cities.isEmpty ? completion(.failure(.noData)) : completion(.success(cities))
        } catch {
            print(error)
            completion(.failure(.noData))
        }
    }
}
