//
//  HomeBuilder.swift
//  Builder+SwiftUI
//
//  Created by 홍성준 on 5/4/24.
//

import SwiftUI

protocol HomeBuildable {
  associatedtype SomeView: View
  func build() -> SomeView
}

struct HomeBuilder: HomeBuildable {
  
  typealias SomeView = HomeView
  
  func build() -> HomeView {
    HomeView()
  }
  
}

struct HomeView: View {
  var body: some View {
    Text("Home View")
  }
}
