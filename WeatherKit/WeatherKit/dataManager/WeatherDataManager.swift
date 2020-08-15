//
//  WeatherDataManager.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 14/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation
import CoreData

class WeatherDataManager {
    
    static let shared = WeatherDataManager()
    
    private let identifier: String = "com.lanouari.WeatherKit"
    private let model: String = "WeatherModel"

    lazy var persistentContainer: NSPersistentContainer = {
        let messageKitBundle = Bundle(identifier: self.identifier)
        let modelURL = messageKitBundle!.url(forResource: self.model, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: self.model, managedObjectModel: managedObjectModel!)
        container.viewContext.mergePolicy = NSMergePolicy(merge: NSMergePolicyType.rollbackMergePolicyType)
        container.loadPersistentStores { (storeDescription, error) in
            if let err = error {
                fatalError("Loading of store failed with error:\(err)")
            }
        }
        return container
    }()
}
