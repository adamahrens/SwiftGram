//
//  MockPostsViewClient.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation
import Combine

struct MockPostsViewClient: APIClient {
  func request<R: APIRequest>(_ request: R) -> AnyPublisher<R.Response, Error> {
    let posts = [Post(id: UUID(), caption: "1 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.bar.com")!),
                 Post(id: UUID(), caption: "2 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.foo.com")!),
                 Post(id: UUID(), caption: "3 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.foo.com")!)]
        
    return Just(posts as! R.Response)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
