//
//  AddTodoView.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftUI
import ComposableArchitecture

struct AddTodoView: View {
  @Bindable var store: StoreOf<AddTodoFeature>
  
  var body: some View {
    Form {
      TextField("Todo", text: $store.todo.todo.sending(\.setTodo))
      Button("Save") {
        store.send(.saveTapped)
      }
    }
    .toolbar {
      ToolbarItem {
        Button("Cancel") {
          store.send(.cancelTapped)
        }
      }
    }
  }
}

#Preview {
  NavigationStack {
    AddTodoView(store: Store(
      initialState: AddTodoFeature.State(todo: .init(id: .init(), todo: "Todo 12345 ", targetDate: Date(), createdAt: Date())),
      reducer: { AddTodoFeature() }
    ))
    .modelContainer(TodoModel.preview)
  }
}
