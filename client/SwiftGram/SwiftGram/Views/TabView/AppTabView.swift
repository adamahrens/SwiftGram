//
//  TabView.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/23/21.
//

import SwiftUI

struct AppTabView: View {
  var body: some View {
    TabView {
      PostsView(viewModel: PostsViewModel(client: MockPostsViewClient()))
        .tabItem {
          Image("Home")
          Text("Home")
        }.tag(0)
      
      Text("Post").tabItem {
        Image("Photo")
        Text("Post")
      }.tag(1)
      
      Text("Profile").tabItem {
        Image("Profile")
        Text("Profile")
      }.tag(2)
    }
  }
}

struct TabView_Previews: PreviewProvider {
  static var previews: some View {
    AppTabView()
  }
}
