//
//  Constants.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

enum Constants {
    
    enum Reusable {
        static let reuseIdentifierCityNameCell = "ReusableCityNameCell"
    }
    
    enum CitiesListViewController {
        static let title = "Cities List"
        static let noData = "The Cities List is empty, click on '+' button to add city"
    }
    
    enum AddCityViewController {
        static let title = "Add City"
    }
    
    enum AlertController {
        static let buttonOk = "OK"
        static let valitionErrorTitle = "Validation Error"
        static let saveError = "Save Error"
        static let valitionErrorMessage = "The fields entered are incorrect, the name must not be empty, and the latitude and longitude must have correct values"
        static let saveErrorMessage = "The name of the city already exist"
    }
}
