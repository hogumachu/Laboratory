//
//  AppView.swift
//  TCATodoSample
//
//  Created by 홍성준 on 3/11/24.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
  let store: StoreOf<AppFeature>
  
  var body: some View {
    TabView {
      ListView(store: store.scope(state: \.list, action: \.list))
        .tabItem {
          Text("List")
        }
    }
  }
  
}
