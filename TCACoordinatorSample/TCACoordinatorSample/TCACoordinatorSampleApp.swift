//
//  TCACoordinatorSampleApp.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftUI

@main
struct TCACoordinatorSampleApp: App {
  var body: some Scene {
    WindowGroup {
      ListCoordinatorView(
        store: .init(
          initialState: .init(),
          reducer: { ListCoordinator() }
        )
      )
    }
  }
}
