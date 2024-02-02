//
//  FeedView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
  @StateObject var viewModel = FeedViewModel()
  @State private var scrollPosition: String?
  @State private var player = AVPlayer()
  
  var body: some View {
    ScrollView {
      LazyVStack(spacing: .zero) {
        ForEach(viewModel.posts) { post in
          FeedCell(post: post, player: player)
            .id(post.id)
            .onAppear { playInitialVideoIfNeeded() }
        }
      }
      .scrollTargetLayout()
    }
    .onAppear { player.play() }
    .scrollPosition(id: $scrollPosition)
    .scrollTargetBehavior(.paging)
    .ignoresSafeArea()
    .onChange(of: scrollPosition) { _, postID in
      playVideoOnChangeOfScrollPosition(postID: postID)
    }
  }
  
  private func playInitialVideoIfNeeded() {
    guard scrollPosition == nil,
          let post = viewModel.posts.first,
          player.currentItem == nil
    else {
      return
    }
    let playerItem = AVPlayerItem(url: URL(string: post.videoURL)!)
    player.replaceCurrentItem(with: playerItem)
  }
  
  private func playVideoOnChangeOfScrollPosition(postID: String?) {
    guard let currentPost = viewModel.posts.first(where: { $0.id == postID }) else { return }
    player.replaceCurrentItem(with: nil)
    let playerItem = AVPlayerItem(url: URL(string: currentPost.videoURL)!)
    player.replaceCurrentItem(with: playerItem)
  }
}

#Preview {
  FeedView()
}
