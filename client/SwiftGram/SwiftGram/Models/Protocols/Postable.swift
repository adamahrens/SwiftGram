//
//  Postable.swift
//  SwiftGram
//
//  Created by Adam Ahrens on 6/21/21.
//

import Foundation

protocol Postable: Codable, Identifiable {
  var id: UUID { get }
  var caption: String { get }
  var createdAt: Date { get }
  var photoUrl: URL { get }
}
