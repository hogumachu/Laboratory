//
//  ListCoordinator.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import ComposableArchitecture
import TCACoordinators

@Reducer
struct ListCoordinator {
  struct State: Equatable, IndexedRouterState {
    var routes: [Route<ListScreen.State>]
    
    init(routes: [Route<ListScreen.State>] = [
      .root(.list(.init()), embedInNavigationView: true)
    ]) {
      self.routes = routes
    }
  }
  
  enum Action: IndexedRouterAction {
    case routeAction(Int, action: ListScreen.Action)
    case updateRoutes([Route<ListScreen.State>])
  }
  
  var body: some ReducerOf<Self> {
    Reduce<State, Action> { state, action in
      switch action {
      case .routeAction(_, action: .list(.itemTapped(let item))):
        state.routes.push(.detail(.init(item: item)))
        
      case .routeAction(_, action: .detail(.closeTapped)):
        state.routes.pop()
        
      default:
        break
      }
      
      return .none
    }
  }
  
}
