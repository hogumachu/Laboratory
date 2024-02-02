//
//  CurrentUserProfileView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 2) {
          ProfileHeaderView()
          PostGridView()
        }
        .padding(.top)
      }
      .navigationTitle("Profile")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  CurrentUserProfileView()
}
