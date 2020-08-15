//
//  CitiesListViewModel.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

protocol CitiesListUseCase {
  var viewModel: Observable<CitiesListViewModel> { get }
  func getCitiesName()
}

class CitiesListViewModel {
  enum CitiesDisplayContext {
    case loading
    case success
    case noData
  }
  
  let citiesName: [String]
  let status: CitiesDisplayContext
  
  internal init(citiesName: [String] = [], status: CitiesListViewModel.CitiesDisplayContext = .loading) {
    self.citiesName = citiesName
    self.status = status
  }
}
