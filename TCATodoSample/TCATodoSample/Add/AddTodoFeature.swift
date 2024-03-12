//
//  AddTodoFeature.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddTodoFeature {
  
  @ObservableState
  struct State: Equatable {
    var todo: TodoModel
    
    init(todo: TodoModel) {
      self.todo = todo
    }
  }
  
  enum Action {
    case cancelTapped
    case saveTapped
    case setTodo(String)
    case delegate(Delegate)
    
    enum Delegate {
      case save(TodoModel)
    }
  }
  
  @Dependency(\.dismiss) var dismiss
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .cancelTapped:
        return .run { _ in await dismiss() }
        
      case .saveTapped:
        return .run { [todo = state.todo] send in
          await send(.delegate(.save(todo)))
          await dismiss()
        }
        
      case .setTodo(let todo):
        state.todo.todo = todo
        return .none
        
      case .delegate:
        return .none
      }
    }
  }
  
}
