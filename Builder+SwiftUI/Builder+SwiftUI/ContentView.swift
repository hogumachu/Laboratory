//
//  ContentView.swift
//  Builder+SwiftUI
//
//  Created by 홍성준 on 5/4/24.
//

import SwiftUI

struct ContentView: View {
  
  private let homeBuilder: any HomeBuildable
  private let detailBuilder: DetailBuildable
  
  init(
    homeBuilder: some HomeBuildable,
    detailBuilder: DetailBuildable
  ) {
    self.homeBuilder = homeBuilder
    self.detailBuilder = detailBuilder
  }
  var body: some View {
    VStack {
      // Type 'any View' cannot conform to 'View'
//      homeBuilder.build()
      
      // Type 'any View' cannot conform to 'View'
//      detailBuilder.build()
    }
    .padding()
  }
  
}
