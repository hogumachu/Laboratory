//
//  TCATodoSampleApp.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import SwiftUI
import SwiftData
import ComposableArchitecture

@main
struct TCATodoSampleApp: App {
  @Dependency(\.database) var database
  var context: ModelContext {
    guard let context = try? database.contenxt() else {
      fatalError()
    }
    return context
  }
  static let store = Store(initialState: AppFeature.State()) {
    AppFeature()
  }
  
  var body: some Scene {
    WindowGroup {
      AppView(store: TCATodoSampleApp.store)
    }
    .modelContext(context)
  }
}
