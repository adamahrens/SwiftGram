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
    let posts = [Post(id: UUID(), caption: "1 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.bar.com")!, user: User(id: UUID(), username: "r0y"), comments: [Comment(id: UUID(), text: "Incubus", by: "r0y"), Comment(id: UUID(), text: "Wish you were here", by: "leroy")]),
                 Post(id: UUID(), caption: "2 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.foo.com")!, user: User(id: UUID(), username: "r0y"), comments: [Comment(id: UUID(), text: "Sweet photo!", by: "r0y"), Comment(id: UUID(), text: "Jealous!", by: "leroy")]),
                 Post(id: UUID(), caption: "3 post ever", createdAt: Date(), photoUrl: URL(string: "https://www.foo.com")!, user: User(id: UUID(), username: "adamahrens"), comments: [Comment(id: UUID(), text: "Times up lets do this", by: "r0y"), Comment(id: UUID(), text: "Take me with!!", by: "leroy")])]
        
    return Just(posts as! R.Response)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
