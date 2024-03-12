//
//  ListScreen.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import ComposableArchitecture

@Reducer
struct ListScreen {
  enum State: Equatable {
    case list(ListFeature.State)
    case detail(DetailFeature.State)
  }
  
  enum Action {
    case list(ListFeature.Action)
    case detail(DetailFeature.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.list, action: /Action.list) {
      ListFeature()
    }
    Scope(state: /State.detail, action: /Action.detail) {
      DetailFeature()
    }
  }
}

enum ListScreenState: Equatable {
  case list(ListFeature.State)
}

enum ListScreeAction {
  case list(ListFeature.Action)
}

