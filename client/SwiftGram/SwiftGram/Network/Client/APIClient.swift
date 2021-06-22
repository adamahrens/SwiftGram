//
//  APIClient.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation
import Combine

enum APIError: Error {
  case requestFailed(Int)
  case processingFailed(Error?)
}
 
protocol APIClient {
  var session: URLSession { get }
  var environment: Environment { get }
  func request<R: APIRequest>(_ request: R) -> AnyPublisher<R.Response, Error>
}

extension APIClient {
  var session: URLSession { URLSession.shared }
  var environment: Environment { Environment.local }
  
  func request<R: APIRequest>(_ request: R) -> AnyPublisher<R.Response, Error> {
    let urlRequest = request.request(environment: environment)
    let pubisher = session.dataTaskPublisher(for: urlRequest).tryMap { data, response -> Data in
      guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
        let code = (response as? HTTPURLResponse)?.statusCode ?? 0
        throw APIError.requestFailed(code)
      }
      
      return data
    }.tryMap { data -> R.Response in
      try request.handle(response: data)
    }
    .tryCatch { error -> AnyPublisher<R.Response, APIError> in throw APIError.processingFailed(error) }
    .receive(on: RunLoop.main)
    .eraseToAnyPublisher()
    
    return pubisher
  }
}
