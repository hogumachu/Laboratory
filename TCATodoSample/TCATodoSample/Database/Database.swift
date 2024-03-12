//
//  Database.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftData
import Dependencies

struct Database {
  var contenxt: () throws -> ModelContext
}

extension Database: DependencyKey {
  static let liveValue = Database(contenxt: {
    do {
      let container = try ModelContainer(
        for: TodoModel.self,
        configurations: ModelConfiguration()
      )
      return ModelContext(container)
    } catch {
      fatalError()
    }
  })
}

extension DependencyValues {
  var database: Database {
    get { self[Database.self] }
    set { self[Database.self] = newValue }
  }
}
