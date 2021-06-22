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
    return Just([1] as! R.Response)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
