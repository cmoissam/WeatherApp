//
//  CitiesListInteractor.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import WeatherKit

class CitiesListInteractor: CitiesListUseCase {
    
    var viewModel: Observable<CitiesListViewModel> = Observable(value: CitiesListViewModel())
    private let weatherInfoService: WeatherInfoService
    
    internal init(weatherInfoService: WeatherInfoService) {
        self.weatherInfoService = weatherInfoService
    }
    
    func getCitiesName() {
        weatherInfoService.getAllCities() { [weak self] result in
            switch result {
            case .success(let data):
                let citiesName: [String] = data.compactMap {
                    $0.name
                }
                self?.viewModel.value = CitiesListViewModel(citiesName: citiesName, status: .success)
            case .failure(_):
                self?.viewModel.value = CitiesListViewModel(status: .noData)
            }
        }
    }
}
