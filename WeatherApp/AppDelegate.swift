//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import UIKit
import WeatherKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Properties
    var window: UIWindow?
    let appDependencies = SharedAppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let coordinator = AppCoordinator(appDependencies: appDependencies)
        window?.rootViewController = coordinator.rootViewController
        window?.makeKeyAndVisible()
        return true
    }
}
