//
//  CityDetailsInteractor.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import WeatherKit

protocol CityWeatherDetailsUseCase {
  var viewModel: Observable<CityDetailsDisplayContext> { get }
  func getCityWeatherDetails()
  
}

class CityWeatherDetailInteractor: CityWeatherDetailsUseCase {
  
  var viewModel: Observable<CityDetailsDisplayContext>
  private let weatherInfoService: WeatherInfoService
  private let cityName: String
  
  internal init(weatherInfoService: WeatherInfoService, cityName: String) {
    self.cityName = cityName
    self.weatherInfoService = weatherInfoService
    self.viewModel = Observable<CityDetailsDisplayContext>(value: .loading(cityName))
  }
  
  func getCityWeatherDetails() {
    weatherInfoService.getCityWeatherInformations(name: cityName) { [weak self] result in
      switch result {
      case .failure(_):
        self?.viewModel.value = .noData
      case .local(let data):
        self?.viewModel.value = .success(CityDetailsViewModel(city: data, isRemote: false))
      case .remote(let data):
        self?.viewModel.value  = .success(CityDetailsViewModel(city: data, isRemote: true))
      }
    }
  }
}
