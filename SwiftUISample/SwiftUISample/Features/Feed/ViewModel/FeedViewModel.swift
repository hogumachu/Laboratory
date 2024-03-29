//
//  FeedViewModel.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import Foundation

final class FeedViewModel: ObservableObject {
  @Published var posts: [Post] = []
  
  private let videoURLs = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
  ]
  
  init() {
    fetchPosts()
  }
  
  func fetchPosts() {
    posts = videoURLs.enumerated().map { offset, url in
      return .init(
        id: UUID().uuidString,
        videoURL: url,
        userName: "User\(offset)",
        content: "This video is cool",
        likes: offset + 30,
        comments: offset,
        isBookmarked: offset % 2 == 0
      )
    }
  }
  
}
