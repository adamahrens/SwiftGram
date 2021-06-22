//
//  AuthRequest.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

extension Notification.Name {
  static let loginNotification = Notification.Name("LoginNotification")
  static let logOutNotification = Notification.Name("LogOutNotification")
}

struct LoginRequest: APIRequest {
  let user: Authable
  var path: String = "/user"
  
  func handle(response: Data) throws -> Void {
    NotificationCenter.default.post(name: .loginNotification, object: nil)
  }
}

struct SignupRequest: APIRequest {
  let user: UserAuthentication
  var path: String = "/user"
  var body: Data? { try? JSONEncoder().encode(user) }
  
  func handle(response: Data) throws -> Void {
    NotificationCenter.default.post(name: .loginNotification, object: nil)
  }
}
