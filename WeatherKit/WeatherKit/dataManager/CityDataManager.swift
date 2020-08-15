//
//  CityDataManager.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 14/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import CoreData

struct CityDataManger {
    fileprivate let weatherDataManager = WeatherDataManager.shared
    fileprivate let entityName = "CityData"
    fileprivate let persistentContainer: NSPersistentContainer

    enum PersistenceError: Error {
        case duplicateName
    }

    init(
        _ persistentContainer: NSPersistentContainer = WeatherDataManager.shared.persistentContainer
    ) {
        self.persistentContainer = persistentContainer
    }

    func updateCityData(name: String, city: CityMapper) throws -> CityData? {
        let context = persistentContainer.viewContext
        let cityData = try getCity(with: name)
        cityData?.update(with: city)
        try context.save()
        return cityData
    }

    func getAllCities() throws -> [CityData] {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CityData>(entityName: entityName)
        let cities = try context.fetch(fetchRequest)
        return cities
    }

    func getCity(with name: String) throws -> CityData? {
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<CityData>(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "name = %@", name)
        let city = try context.fetch(fetchRequest).first
        return city
    }

    public func createCityData(
        name: String,
        longitude: Double,
        latitude: Double
    ) throws {
        guard try getCity(with: name) == nil else {
            throw PersistenceError.duplicateName
        }
        let context = persistentContainer.viewContext
        let cityStore = NSEntityDescription.insertNewObject(forEntityName: entityName, into: context) as! CityData
        
        cityStore.name = name
        cityStore.longitude  = longitude
        cityStore.latitude = latitude
        try context.save()
    }
}

// extension of Data base entity "CityData"
extension CityData {
    
    func update(with city: CityMapper) {
        self.longitude = city.longitude
        self.latitude = city.latitude
        self.currentTime = city.currentWeather.currentTime
        self.feelsLike = city.currentWeather.feelsLike
        self.timeZone = city.timeZone
        self.humidity = Int64(city.currentWeather.humidity)
        self.pressure = Int64(city.currentWeather.pressure)
        self.temperature = city.currentWeather.temperature
        self.windSpeed = city.currentWeather.windSpeed
        self.windDegree = Int64(city.currentWeather.windDegree)
        if let weather = city.currentWeather.weather.first {
            self.weatherId = Int64(weather.id)
            self.weatherMain = weather.main
            self.weatherDescription = weather.description
            self.weatherIconPath = weather.icon
        }
        self.filled = true
    }
}
