//
//  SwiftGramApp.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI

@main
struct SwiftGramApp: App {
  var body: some Scene {
    WindowGroup {
      MainApp(provider: MainContentProvider(authable: nil))
    }
  }
}
