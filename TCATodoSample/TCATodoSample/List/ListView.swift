//
//  ListView.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import SwiftUI
import ComposableArchitecture

struct ListView: View {
  let store: StoreOf<ListFeature>
  
  var body: some View {
    VStack {
      Text("Todo")
        .font(.largeTitle)
        .padding()
      List(store.todos) { todo in
        Text(todo.todo)
      }
    }
    .onAppear {
      store.send(.onAppear)
    }
  }
  
}

#Preview {
  ListView(store: Store(initialState: ListFeature.State()) {
    ListFeature()
  })
  .modelContainer(TodoModel.preview)
}
