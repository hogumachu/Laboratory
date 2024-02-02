//
//  Post.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import Foundation

struct Post: Identifiable, Codable {
  let id: String
  let videoURL: String
  let userName: String
  let content: String
  let likes: Int
  let comments: Int
  let isBookmarked: Bool
}
