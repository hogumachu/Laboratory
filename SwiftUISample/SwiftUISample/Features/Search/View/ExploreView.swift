//
//  ExploreView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct ExploreView: View {
  @StateObject var viewModel = ExploreViewModel()
  
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 16) {
          ForEach(viewModel.users) { user in
            UserCell(user: user)
              .padding(.horizontal)
          }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.top)
      }
    }
  }
}

#Preview {
  ExploreView()
}
