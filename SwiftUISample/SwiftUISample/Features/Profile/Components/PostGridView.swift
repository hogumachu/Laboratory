//
//  PostGridView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct PostGridView: View {
  private let columns = [
    GridItem(.flexible(), spacing: 1),
    GridItem(.flexible(), spacing: 1),
    GridItem(.flexible(), spacing: 1)
  ]
  
  private let width = (UIScreen.main.bounds.width / 3) - 2
  
  var body: some View {
    LazyVGrid(columns: columns, spacing: 2) {
      ForEach(0..<40) { post in
        Rectangle()
          .frame(width: width, height: 160)
          .clipped()
      }
    }
  }
}

#Preview {
  PostGridView()
}
