//
//  ListFeature.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import Foundation
import SwiftData
import ComposableArchitecture

@Reducer
struct ListFeature {
  
  @ObservableState
  struct State: Equatable {
    var todos: [TodoModel] = [
      .init(id: .init(), todo: "T1", targetDate: Date(), createdAt: Date())
    ]
    var isLoading = false
    var sortBy: SortDescriptor<TodoModel> {
      return .init(\.createdAt)
    }
    var fetchDescriptor: FetchDescriptor<TodoModel> {
      return .init(sortBy: [sortBy])
    }
  }
  
  enum Action {
    case onAppear
    case setTodos([TodoModel])
  }
  
  @Dependency(\.todoDatabase) var database
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onAppear:
        state.isLoading = true
        return .run { @MainActor send in
          try send(.setTodos(database.fetchAll()))
        }
        
      case .setTodos(let todos):
        state.todos = todos
        state.isLoading = false
        return .none
      }
    }
  }
  
}
