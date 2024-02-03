//
//  AppView.swift
//  TCATutorial
//
//  Created by 홍성준 on 2/3/24.
//

import ComposableArchitecture
import SwiftUI


struct AppView: View {
  let store: StoreOf<AppFeature>
  
  var body: some View {
    TabView {
      CounterView(store: store.scope(state: \.tab1, action: \.tab1))
        .tabItem {
          Text("Counter 1")
        }
      
      CounterView(store: store.scope(state: \.tab2, action: \.tab2))
        .tabItem {
          Text("Counter 2")
        }
    }
  }
}

#Preview {
  AppView(store: TCATutorialApp.store)
}
