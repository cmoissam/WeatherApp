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
}

class AppCoordinator: AppRoutingLogic {
    
    let rootViewController = AppNavigationController()
    
    init() {
        self.rootViewController.viewControllers = [CitiesListViewController(interactor: CitiesListInteractor(weatherInfoService: WeatherInfoService()))]
    }
    
    func showAddCityViewController() {
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
