//
//  Observable.swift
//  WeatherApp
//
//  Created by Issam Lanouari on 15/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

/// Simple type to observe property change
/// An observable can have multiple observer
class Observable<T> {
    var value: T {
        didSet {
            self.valuesChanged.forEach { closure in
                closure(self.value)
            }
        }
    }
    
    private var valuesChanged: [((T) -> Void)] = []
    
    init(value: T) {
        self.value = value
    }
    
    /// Add closure as an observer and trigger the closure immediately if fireNow = true
    func addObserver(fireNow: Bool = false, _ onChange: @escaping ((T) -> Void)) {
        valuesChanged.append(onChange)
        if fireNow {
            onChange(value)
        }
    }
}

