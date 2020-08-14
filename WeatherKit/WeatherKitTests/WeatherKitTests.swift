//
//  WeatherKitTests.swift
//  WeatherKitTests
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import XCTest
import CoreData
@testable import WeatherKit

class NetworkManagerTests: XCTestCase {
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
    func test_getCity_service() {
        let oneCallService = WeatherInfoService(mockPersistentContainer)
        oneCallService.createNewCity(name: "TestCity", longitude: 20.0, latitude: 30.4) {   result in
            switch result {
            case let .failure(error):
                XCTFail(error.localizedDescription)
            default:
                break
            }
        }
    }
    func test_getAllCities_service() {
        let oneCallService = WeatherInfoService(mockPersistentContainer)
        oneCallService.createNewCity(name: "TestCity", longitude: 20.0, latitude: 30.4, completion: { _ in })
        oneCallService.getAllCities() { result in
            switch result {
            case let .success(citiesnames):
                XCTAssertEqual(1, citiesnames.count)
            case let .failure(error):
                XCTFail(error.localizedDescription)
            }
        }
    }
}
