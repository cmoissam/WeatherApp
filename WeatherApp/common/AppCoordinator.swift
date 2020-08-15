//
//  AppCoordinator.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import UIKit
import WeatherKit
protocol AppRoutingLogic: class {
    func showAddCityViewController()
    func showCityWeatherDetailViewController(cityName: String)
}

class AppCoordinator: AppRoutingLogic {
    
    let rootViewController = AppNavigationController()
    let appDependencies: SharedRootContainer
    
    init(appDependencies: SharedRootContainer) {
        self.appDependencies = appDependencies
        self.rootViewController.viewControllers = [appDependencies.makeCitiesListViewController(coordinator: self)]
    }
    func showAddCityViewController() {
        let vc = appDependencies.makeAddCityViewController()
        rootViewController.pushViewController(vc, animated: true)
    }
    
    func showCityWeatherDetailViewController(cityName: String) {
        let vc = appDependencies.makeCityWeatherDetailsViewController(cityName: cityName)
        rootViewController.pushViewController(vc, animated: true)
    }
}

class AppNavigationController: UINavigationController {
    
    // MARK :- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = .white
        navigationBar.barStyle = .black
        navigationBar.backgroundColor = .systemBlue
    }
}
