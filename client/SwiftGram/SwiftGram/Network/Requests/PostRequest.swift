//
//  PostRequest.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

struct PostRequest: APIRequest {
  let path: String = "/posts"

  func handle(response: Data) throws -> [Post] {
    return try JSONDecoder().decode([Post].self, from: response)
  }
}
