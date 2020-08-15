//
//  Date+Extensions.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

public extension Date {
    
    /// Return string representation of date, we use french format with european timezone
    ///
    /// - Parameter format: enum which contain date format
    /// - Returns: string formatted date
    func toString(dateFormat: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.string(from: self)
    }
}

/// Representation of a date format
public enum DateFormat: String {
    case defaultDateFormat = "yyyy-MM-dd/HH:mm:ss"
}
