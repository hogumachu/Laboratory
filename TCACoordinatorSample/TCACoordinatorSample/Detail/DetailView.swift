//
//  DetailView.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftUI
import ComposableArchitecture

struct DetailView: View {
  let store: StoreOf<DetailFeature>
  
  var body: some View {
    VStack {
      Text(store.item)
      Button(
        action: { store.send(.closeTapped) },
        label: { Text("닫기") }
      )
    }
    .toolbar(.hidden, for: .navigationBar)
  }
  
}
