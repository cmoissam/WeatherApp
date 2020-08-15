//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

enum State {
    case error
    case success
}

protocol AddCityUseCase {
    var  stateObserver: Observable<State> { get }
    func AddNewCity(name: String, longitude: Double, latitude: Double)
    
}

struct AddCityViewModel {
    var name: String
    var longitude: Double
    var latitude: Double
    
    /// Rules:
    /// - name should not be empty
    /// - longitude should not be empty, and should be a value between -180 and 180
    /// - latitude should not be empty, and should be a value between -90 and 90
    init?(
        name: String?,
        longitude: String?,
        latitude: String?
    ) {
        guard let safeName = name, !safeName.isEmpty else { return nil }
        guard let safeLongitude = Double(longitude ?? ""), safeLongitude < 180, safeLongitude > -180 else { return nil }
        guard let safeLatitude = Double(latitude ?? ""), safeLatitude < 90, safeLatitude > -90  else { return nil }
        self.name = safeName
        self.longitude = safeLongitude
        self.latitude = safeLatitude
    }
}
