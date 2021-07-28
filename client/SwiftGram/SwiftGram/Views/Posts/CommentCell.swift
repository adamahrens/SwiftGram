//
//  CommentCell.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 7/28/21.
//

import SwiftUI

struct CommentCell: View {
  let comment: Comment
  var body: some View {
    HStack(alignment: .top, spacing: 8) {
      Image(systemName: "person.circle")
        .resizable()
        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
      VStack(alignment: .leading, spacing: 8.0) {
        Text(comment.text)
          .fontWeight(.medium)
        Text(comment.by)
          .fontWeight(.light)
      }
    }
    .padding([.top, .bottom], 10)
  }
}

struct CommentCell_Previews: PreviewProvider {
  static var previews: some View {
    CommentCell(comment: Comment(id: UUID(), text: "Sweet pictures!", by: "leroy"))
  }
}
