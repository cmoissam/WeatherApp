//
//  CityDataManagerTest.swift
//  WeatherKitTests
//
//  Created by Issam Lanouari on 14/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest
@testable import WeatherKit
import CoreData

class CityDataManagerTest: XCTestCase {

    lazy var mockPersistentContainer: NSPersistentContainer = {
        let messageKitBundle = Bundle(identifier: "com.lanouari.WeatherKit")
        let modelURL = messageKitBundle!.url(forResource: "WeatherModel", withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: "CityData", managedObjectModel: managedObjectModel!)
        let description = NSPersistentStoreDescription()
        
        description.type = NSInMemoryStoreType
        description.shouldAddStoreAsynchronously = false // Make it simpler in test env
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores { (description, error) in
            // Check if the data store is in memory
            precondition( description.type == NSInMemoryStoreType )
            // Check if creating container wrong
            if let error = error {
                fatalError("Create an in-mem coordinator failed \(error)")
            }
        }
        return container
    }()
    
    var testCities: [CityData] = []
    
    func test_create_city() {
        do {
            try CityDataManger(WeatherDataManager.shared.persistentContainer).createCityData(name: "SameName", longitude: 40, latitude: 30)
            try CityDataManger(WeatherDataManager.shared.persistentContainer).createCityData(name: "SameName", longitude: 23, latitude: 45)
            XCTFail("name constraint deleted")
        } catch {
            print(error)
        }
    }

    func test_getCity() {
        do {
            try CityDataManger(mockPersistentContainer).createCityData(name: "GETME", longitude: 23, latitude: 45)
            if try CityDataManger(mockPersistentContainer).getCity(with: "GETME") == nil {
                XCTFail("no Data")
            }
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
