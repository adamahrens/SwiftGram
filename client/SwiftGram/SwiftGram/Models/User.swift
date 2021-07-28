//
//  User.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 7/28/21.
//

import Foundation

struct User: Codable, Identifiable {
  let id: UUID
  let username: String
}
