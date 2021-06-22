//
//  PostsView.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI
import Combine

struct PostsView: View {
  let viewModel: PostsViewModel
  
  var body: some View {
    List(viewModel.posts, id: \.id) { post in
      Text(post.caption)
    }
    .navigationTitle("SwiftGram")
  }
}

struct PostsView_Previews: PreviewProvider {
  static var previews: some View {
    PostsView(viewModel: PostsViewModel(client: MockPostsViewClient()))
  }
}
