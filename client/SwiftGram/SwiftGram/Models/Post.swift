//
//  Post.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

struct Post: Postable {
  let id: UUID
  let caption: String
  let createdAt: Date
  let photoUrl: URL
}
