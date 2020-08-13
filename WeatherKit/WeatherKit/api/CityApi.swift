//
//  CityApi.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 13/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

struct CityApi {
    enum NetworkConfiguration {
           static let apiKey = "13659ddaee8baee6986fcfd5c84dd693"
           static let endpoint = "api.openweathermap.org"
           static let excluded = "hourly,daily,minutely"
    }

    func getCityInformation(
        longitude: Double,
        latitude: Double,
        completion: @escaping RequestCompletion<CityMapper>
    ) {
        guard let url = self.prepareUrlComponents(
            longitude: longitude,
            latitude: latitude
        ).url else {
            completion(nil, nil)
            fatalError("cannot Get the url")
        }
        let ressources = Resource<CityMapper>(url: url, method: .GET, successStatusCode: 200)
        NetworkManager.request(ressources, completion: completion)
    }
    
    fileprivate func prepareUrlComponents(
        longitude: Double,
        latitude: Double
    ) -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.host = NetworkConfiguration.endpoint
        urlComponents.scheme = "https"
        urlComponents.path = "/data/2.5/onecall"
        urlComponents.queryItems = [
            URLQueryItem(name: "lat", value: String(latitude)),
            URLQueryItem(name: "lon", value: String(longitude)),
            URLQueryItem(name: "appid", value: NetworkConfiguration.apiKey),
            URLQueryItem(name: "exclude", value: NetworkConfiguration.excluded)
        ]
        return urlComponents
    }
}
