//
//  AddCityInteractor.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import WeatherKit

class AddCityInteractor: AddCityUseCase {
    
    var stateObserver = Observable<State>(value: .success)
    private let weatherInfoService: WeatherInfoService
    
    internal init(weatherInfoService: WeatherInfoService) {
        self.weatherInfoService = weatherInfoService
    }
    
    
    func AddNewCity(name: String, longitude: Double, latitude: Double) {
        weatherInfoService.createNewCity(
            name: name,
            longitude: longitude,
            latitude: latitude) { [weak self] in
                switch $0 {
                case .success:
                    self?.stateObserver.value = .success
                case .failure(_):
                    self?.stateObserver.value = .error
                }
        }
    }
}
