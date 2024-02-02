//
//  CustomVideoPlayer.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI
import AVKit

struct CustomVideoPlayer: UIViewControllerRepresentable {
  var player: AVPlayer
  
  func makeUIViewController(context: Context) -> UIViewController {
    let controller = AVPlayerViewController()
    controller.player = player
    controller.showsPlaybackControls = false
    controller.exitsFullScreenWhenPlaybackEnds = true
    controller.allowsPictureInPicturePlayback = true
    controller.videoGravity = .resizeAspectFill
    return controller
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
}
