//
//  AppFeature.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import ComposableArchitecture

@Reducer
struct AppFeature {
  struct State: Equatable {
    var list = ListFeature.State()
  }
  
  enum Action {
    case list(ListFeature.Action)
  }
  
  var body: some ReducerOf<AppFeature> {
    Scope(state: \.list , action: \.list) {
      ListFeature()
    }
    
    Reduce { state, action in
      return .none
    }
  }
}
