//
//  LoginSignupViewModel.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation
import Combine
import SwiftUI

enum AuthState: String, CaseIterable {
  case signUp = "Sign Up"
  case login = "Login"
  
  var localizedName: LocalizedStringKey { LocalizedStringKey(rawValue) }
}

final class LoginSignupViewModel {
  
  let client: APIClient
  
  private var cancellables = Set<AnyCancellable>()

  init(client: APIClient) {
    self.client = client
  }
  
  func login() {
    
  }
  
  func signup() {
    
  }
}
