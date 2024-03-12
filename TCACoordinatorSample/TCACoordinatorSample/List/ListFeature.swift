//
//  ListFeature.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ListFeature {
  @ObservableState
  struct State: Equatable {
    var items: [String] = ["A", "B", "C"]
  }
  
  enum Action {
    case onAppear
    case itemTapped(String)
  }
  
  var body: some ReducerOf<Self> {
    Reduce<State, Action> { state, action in
      print("# 여기: \(action)")
      switch action {
      case .onAppear:
        state.items = ["A"]
        return .none
        
      case .itemTapped(let item):
        return .none
      }
    }
  }
}
