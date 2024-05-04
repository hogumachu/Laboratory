//
//  DetailBuilder.swift
//  Builder+SwiftUI
//
//  Created by 홍성준 on 5/4/24.
//

import SwiftUI

protocol DetailBuildable {
  func build() -> any View
}

struct DetailBuilder: DetailBuildable {
  
  func build() -> any View {
    DetailView()
  }
  
}

struct DetailView: View {
  var body: some View {
    Text("Detail View")
  }
}
