//
//  MainContentProvider.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI

protocol MainContentProviderProtocol {

  var authable: Authable? { get set }
  
  init(authable: Authable?)
  
  func mainView() -> AnyView
}

final class MainContentProvider: MainContentProviderProtocol {
  var authable: Authable?
  
  init(authable: Authable?) {
    self.authable = authable
  }
  
  func mainView() -> AnyView {
    authable == nil ? AnyView(LoginSignupView(viewModel: LoginSignupViewModel(client: MockAuthClient()))) :
                      AnyView(PostsView(viewModel: PostsViewModel(client: MockPostsViewClient())))
  }
}
