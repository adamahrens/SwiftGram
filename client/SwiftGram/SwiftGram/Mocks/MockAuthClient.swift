//
//  MockAuthClient.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation
import Combine

struct MockAuthClient: APIClient {
  func request<R: APIRequest>(_ request: R) -> AnyPublisher<R.Response, Error> {
    let id = UUID()
    
    if let _ = request as? LoginRequest {
      let userAuth = LoginAuthentication(id: id.uuidString, email: nil, username: "ahrens", password: "password123")
      return Just(Data())
        .setFailureType(to: Error.self)
        .tryMap { data -> R.Response in
          let encoded = try JSONEncoder().encode(userAuth)
          return try request.handle(response: encoded)
        }
        .eraseToAnyPublisher()
    }
    
    let userAuth = SignUpAuthentication(id: id.uuidString, username: "ahrens@email.com", password: "ahrens", email: "password123")
    return Just(userAuth as! R.Response)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
