//
//  PostCell.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 7/28/21.
//

import SwiftUI

struct PostCell: View {
  let post: Post
  let placeholder = UIImage(named: "puppies")!
  
  @State var image: UIImage? = nil
  
  var body: some View {
    VStack(alignment: .leading) {
      Image(uiImage: image ?? placeholder)
        .resizable()
        .scaledToFit()
        .cornerRadius(15)
        .overlay({
          VStack(spacing: 15) {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image("filled")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image("comment")
            })
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
              Image("share")
            })
            
          }
          .padding()
          .shadow(radius: 3)
          
        }(), alignment: .bottomTrailing)
      HStack {
        Text(post.caption)
          .fontWeight(.light)
        Text("by")
        Text(post.user.username)
          .fontWeight(.medium)
          .foregroundColor(.accentColor)
      }.padding(.leading, 20)
      
      ForEach(post.comments, id: \.id) { comment in
        CommentCell(comment: comment)
      }
    }
  }
}

struct PostCell_Previews: PreviewProvider {
  static var previews: some View {
    PostCell(post: Post(id: UUID(), caption: "Vacay 2021", createdAt: Date(), photoUrl: URL(string: "https://images.unsplash.com/photo-1473496169904-658ba7c44d8a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")!, user: User(id: UUID(), username: "adamahrens"), comments: [Comment(id: UUID(), text: "Sweet photo!", by: "r0y"), Comment(id: UUID(), text: "Jealous!", by: "leroy")]))
  }
}
