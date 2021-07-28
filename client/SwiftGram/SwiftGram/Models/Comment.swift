//
//  Comment.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 7/28/21.
//

import Foundation

struct Comment: Codable, Identifiable {
  let id: UUID
  let text: String
  let by: String
}
