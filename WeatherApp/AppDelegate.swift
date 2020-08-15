//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = AppNavigationController(rootViewController: CitiesListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
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

