//
//  Resource.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

struct Resource<T> {

  /// The url where the resource is located (including associated parameters).
  let url: URL

  /// The HTTP method to use to request this resource.
  let method: HTTPMethod

  /// The response status code to match against in order to decide whether the request was successful or not.
  let successStatusCode: Int
  /// Strategie used for formatting date when decoding them from JSON.
  let dateDecodingStrategy: JSONDecoder.DateDecodingStrategy
  
  init(url: URL, method: HTTPMethod, successStatusCode: Int, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .secondsSince1970) {
    self.url = url
    self.method = method
    self.successStatusCode = successStatusCode
    self.dateDecodingStrategy = dateDecodingStrategy
  }
}
