//
//  HTTPMethod.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    /// Requests data from a specified resource
    case GET
    /// Submits data to be processed to a specified resource
    case POST
    /// Uploads a representation of the specified URI
    case PUT

    /// All needed methods can be added here...
}
