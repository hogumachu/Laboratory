//
//  ViewController.swift
//  FrameBaseLayoutSample
//
//  Created by 홍성준 on 2/17/24.
//

import UIKit
import PinLayout
import FlexLayout

class ViewController: UIViewController {
  
  private let homeView = HomeView()
  
  override func loadView() {
    view = homeView
  }
  
}

#Preview {
  ViewController()
}
