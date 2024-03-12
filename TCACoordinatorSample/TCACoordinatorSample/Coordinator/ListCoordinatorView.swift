//
//  ListCoordinatorView.swift
//  TCACoordinatorSample
//
//  Created by 홍성준 on 3/12/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct ListCoordinatorView: View {
  
  let store: StoreOf<ListCoordinator>
  
  var body: some View {
    TCARouter(store) { screen in
      return SwitchStore(screen) { screen in
        switch screen {
        case .list:
          CaseLet(
            /ListScreen.State.list,
             action: ListScreen.Action.list,
             then: ListView.init
          )
          
        case .detail:
          CaseLet(
            /ListScreen.State.detail,
             action: ListScreen.Action.detail,
             then: DetailView.init
          )
        }
      }
    }
  }
  
}
