//
//  TCATutorialApp.swift
//  TCATutorial
//
//  Created by 홍성준 on 2/2/24.
//

import ComposableArchitecture
import SwiftUI

@main
struct TCATutorialApp: App {
  static let store = Store(initialState: AppFeature.State()) {
    AppFeature()
  }
  
  var body: some Scene {
    WindowGroup {
      AppView(store: TCATutorialApp.store)
    }
  }
}
