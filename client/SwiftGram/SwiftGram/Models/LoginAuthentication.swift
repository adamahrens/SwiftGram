//
//  LoginAuthentication.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/22/21.
//

import Foundation

struct LoginAuthentication: Authable {
  let id: String
  let email: String?
  let username: String
  let password: String
}
