//
//  MainApp.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI

struct MainApp: View {
  @State var provider: MainContentProviderProtocol
  
  private let loginPublisher = NotificationCenter.default.publisher(for: .loginNotification).receive(on: RunLoop.main)
  private let logOutPublisher = NotificationCenter.default.publisher(for: .logOutNotification).receive(on: RunLoop.main)
    
  var body: some View {
    NavigationView {
      provider.mainView()
    }.onReceive(loginPublisher) { notification in
      if let auth = notification.object as? LoginAuthentication {
        provider.authable = auth
      }
    }
    .onReceive(logOutPublisher) { _ in
      provider.authable = nil
    }
  }
}

struct MainApp_Previews: PreviewProvider {
  static var previews: some View {
    MainApp(provider: MainContentProvider(authable: nil))
  }
}
