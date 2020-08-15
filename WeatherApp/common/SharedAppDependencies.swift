//
//  SharedAppDependencies.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import WeatherKit

protocol SharedRootContainer: class {
    func makeCitiesListViewController(coordinator: AppRoutingLogic) -> CitiesListViewController
    func makeAddCityViewController() -> AddCityViewController
}

class SharedAppDependencies: SharedRootContainer {
    
    
    private let weatherInfoService = WeatherInfoService()
    
    func makeAddCityViewController() -> AddCityViewController {
        AddCityViewController()
    }
    
    func makeCitiesListViewController(coordinator: AppRoutingLogic) -> CitiesListViewController {
        return CitiesListViewController(
            interactor: CitiesListInteractor(weatherInfoService: weatherInfoService),
            coordinator: coordinator
        )
    }
}
