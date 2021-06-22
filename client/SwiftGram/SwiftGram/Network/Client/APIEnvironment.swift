//
//  APIEnvironment.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

struct Environment {
  var baseUrl: URL
}

extension Environment {
  static let production = Environment(baseUrl: URL(string: "https://swiftgram.com/api/v1")!)
  static let local = Environment(baseUrl: URL(string: "http://localhost:8080/api/v1")!)
  static let local2 = Environment(baseUrl: URL(string: "http://localhost:8081/api/v1")!)
}
