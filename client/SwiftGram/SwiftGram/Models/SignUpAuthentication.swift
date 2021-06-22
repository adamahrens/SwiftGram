//
//  UserAuthentication.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

struct SignUpAuthentication: Authable {
  let id: String
  let username: String
  let password: String
  let email: String?
}
