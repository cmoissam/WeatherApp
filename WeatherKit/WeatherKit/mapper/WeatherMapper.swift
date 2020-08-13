//
//  WeatherMapper.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 13/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

public struct WeatherMapper: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String

    internal enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}
