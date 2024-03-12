//
//  TodoModel.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import Foundation
import SwiftData

@Model
final class TodoModel {
  @Attribute(.unique) var id: UUID
  var todo: String
  var targetDate: Date
  var createdAt: Date
  
  init(
    id: UUID,
    todo: String,
    targetDate: Date,
    createdAt: Date
  ) {
    self.id = id
    self.todo = todo
    self.targetDate = targetDate
    self.createdAt = createdAt
  }
}

extension TodoModel {
  
  static var preview: ModelContainer {
    let container = try! ModelContainer(
      for: TodoModel.self,
      configurations: .init(isStoredInMemoryOnly: true)
    )
    Task { @MainActor in
      container.mainContext.insert(TodoModel(id: .init(), todo: "Todo1", targetDate: Date(), createdAt: Date()))
      container.mainContext.insert(TodoModel(id: .init(), todo: "Todo2", targetDate: Date(), createdAt: Date()))
      container.mainContext.insert(TodoModel(id: .init(), todo: "Todo3", targetDate: Date(), createdAt: Date()))
      container.mainContext.insert(TodoModel(id: .init(), todo: "Todo4", targetDate: Date(), createdAt: Date()))
      try! container.mainContext.save()
    }
    return container
  }
  
}
