//
//  FeedCell.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
  let post: Post
  let player: AVPlayer
  
  init(post: Post, player: AVPlayer) {
    self.post = post
    self.player = player
  }
  
  var body: some View {
    ZStack {
      CustomVideoPlayer(player: player)
        .containerRelativeFrame([.horizontal, .vertical])
      
      VStack {
        Spacer()
        
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            Text("John Doe")
              .fontWeight(.semibold)
            
            Text("This post is awesome")
          }
          .foregroundStyle(.white)
          .font(.subheadline)
          
          Spacer()
          
          VStack(spacing: 15) {
            Circle()
              .frame(width: 40, height: 40)
              .foregroundStyle(.gray)
            
            Button {
              
            } label: {
              VStack {
                Image(systemName: "heart.fill")
                  .resizable()
                  .frame(width: 30, height: 25)
                  .foregroundStyle(.white)
                
                Text("27")
                  .font(.footnote)
                  .foregroundStyle(.white)
                  .bold()
              }
            }
            
            Button {
              
            } label: {
              VStack {
                Image(systemName: "ellipsis.bubble.fill")
                  .resizable()
                  .frame(width: 30, height: 25)
                  .foregroundStyle(.white)
                
                Text("27")
                  .font(.footnote)
                  .foregroundStyle(.white)
                  .bold()
              }
            }
            
            Button {
              
            } label: {
              Image(systemName: "bookmark.fill")
                .resizable()
                .frame(width: 20, height: 25)
                .foregroundStyle(.white)
            }
            
            Button {
              
            } label: {
              Image(systemName: "arrowshape.turn.up.right.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundStyle(.white)
            }
          }
        }
        .padding(.bottom, 80)
      }
      .padding()
    }
    .onTapGesture {
      onTap()
    }
  }
  
  private func onTap() {
    switch player.timeControlStatus {
    case .paused:
      player.play()
      
    case .waitingToPlayAtSpecifiedRate:
      break
      
    case .playing:
      player.pause()
      
    @unknown default:
      break
    }
  }
}

#Preview {
  FeedCell(
    post: .init(
      id: UUID().uuidString,
      videoURL: ""
    ),
    player: AVPlayer()
  )
}
