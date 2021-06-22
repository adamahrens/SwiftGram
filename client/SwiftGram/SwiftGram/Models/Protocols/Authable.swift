//
//  Authable.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

protocol Authable: Codable {
  var id: String { get }
  var username: String { get }
  var password: String { get }
  var email: String? { get }
}
