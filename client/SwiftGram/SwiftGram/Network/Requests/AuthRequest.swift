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
  let user: LoginAuthentication
  var path: String = "/user"
  var body: Data? { try? JSONEncoder().encode(user) }
  
  func handle(response: Data) throws -> Authable {
    guard let user = try? JSONDecoder().decode(LoginAuthentication.self, from: response) else {
      throw APIError.processingFailed(nil)
    }
    
    NotificationCenter.default.post(name: .loginNotification, object: user)
    return user
  }
}

struct SignupRequest: APIRequest {
  let user: SignUpAuthentication
  var path: String = "/user"
  var body: Data? { try? JSONEncoder().encode(user) }
  
  func handle(response: Data) throws -> Authable {
    guard let user = try? JSONDecoder().decode(SignUpAuthentication.self, from: response) else {
      throw APIError.processingFailed(nil)
    }
    
    NotificationCenter.default.post(name: .loginNotification, object: user)
    return user
  }
}
