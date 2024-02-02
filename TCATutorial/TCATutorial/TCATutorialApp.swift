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
  var body: some Scene {
    WindowGroup {
      CounterView(
        store: Store(initialState: CounterFeature.State()) {
          CounterFeature()
        }
      )
    }
  }
}
