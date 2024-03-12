//
//  DetailFeature.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import ComposableArchitecture

@Reducer
struct DetailFeature {
  @ObservableState
  struct State: Equatable {
    let item: String
  }
  
  enum Action {
    case closeTapped
  }
  
  var body: some ReducerOf<Self> {
    Reduce<State, Action> { state, action in
      return .none
    }
  }
  
}
