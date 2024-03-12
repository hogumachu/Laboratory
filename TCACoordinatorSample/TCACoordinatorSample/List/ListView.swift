//
//  ListView.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftUI
import ComposableArchitecture

struct ListView: View {
  let store: StoreOf<ListFeature>
  
  var body: some View {
    VStack {
      Text("List")
        .font(.headline)
      List {
        ForEach(store.items, id: \.self) { item in
          Button(
            action: { store.send(.itemTapped(item))},
            label: { Text(item) }
          )
        }
      }
    }
    .onAppear {
      store.send(.onAppear)
    }
  }
}

#Preview {
  ListView(store: .init(
    initialState: .init(),
    reducer: { ListFeature() }
  ))
}
