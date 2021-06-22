//
//  PostsViewModel.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Combine

final class PostsViewModel: ObservableObject {
  
  @Published var posts = [Post]()
  
  let client: APIClient
  
  private var cancellables = Set<AnyCancellable>()
  
  init(client: APIClient) {
    self.client = client
    
    handle(request: PostRequest())
  }
  
  func handle<R: APIRequest>(request: R) {
    if let r = request as? PostRequest {
      client
        .request(r)
        .sink { result in
          switch result {
            case .finished : print("Completed")
            case .failure(let error): print("Errored: \(error.localizedDescription)")
          }
        } receiveValue: { [weak self] posts in
          self?.posts = posts
        }.store(in: &cancellables)
    }
  }
}
