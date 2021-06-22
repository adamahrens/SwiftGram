//
//  APIRequest.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

enum RequestError: Error {
  case badUrl
}

enum HTTPMethod: String {
  case GET
  case POST
  case UPDATE
}

protocol APIRequest {
  associatedtype Response
  var method: HTTPMethod { get }
  var path: String { get }
  var headers: [String : String]?  { get }
  var body: Data? { get }
  func handle(response: Data) throws -> Response
  func request(environment: Environment) -> URLRequest
}

/// Default Implementations
extension APIRequest{
  
  var method: HTTPMethod { .GET }
  
  var body: Data? { nil }
  
  var headers: [String : String]?  { nil }
 
  func request(environment: Environment) -> URLRequest {
    var url = environment.baseUrl
    url.appendPathComponent(path)
    
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.httpBody = body
    
    if let headers = headers, headers.count > 0 {
      request.allHTTPHeaderFields = headers
    }
    
    return request
  }
}
