//
//  UserAuthentication.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

struct SignUpAuthentication: Authable {
  let id: String
  let email: String
  let password: String
}
