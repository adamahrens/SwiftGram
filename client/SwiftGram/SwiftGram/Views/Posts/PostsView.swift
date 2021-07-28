//
//  PostsView.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import SwiftUI
import Combine

struct PostsView: View {
  @ObservedObject var viewModel: PostsViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("SwiftGram")
        .font(.title)
        .fontWeight(.semibold)
        .foregroundColor(.accentColor)
        .padding(.leading, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
      List(viewModel.posts, id: \.id) { post in
        PostCell(post: post)
      }
    }
  }
}

struct PostsView_Previews: PreviewProvider {
  static var previews: some View {
    PostsView(viewModel: PostsViewModel(client: MockPostsViewClient()))
  }
}
