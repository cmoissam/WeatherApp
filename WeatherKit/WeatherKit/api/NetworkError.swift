//
//  NetworkError.swift
//  WeatherKit
//
//  Created by Issam Lanouari on 12/08/2020.
//  Copyright © 2020 Issam Lanouari. All rights reserved.
//

import Foundation

/// The NetworkError Parser for HTTP errors
internal enum NetworkError: Error {

  /// Invalid HTTP Response.
  case invalidResponse(URLResponse?)

  /// The data returned could not be read.
  /// You can introspect the associated data in this `case` to see what went wrong.
  case invalidResponseData(Data?)

  /// Expected data but received none.
  case noDataReceived

  /// There was an error making this request, see the associated error description.
  case requestFailed(String)

  /// The request timed out
  case requestTimedOut

  /// Network is down
  case noNetwork

  /// Could not resolve hostname
  case unresolvedHostname

  /// There was a problem at the server level and the response status code is in the range: 500-599
  case serverError(Int)

}
