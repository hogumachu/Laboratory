//
//  NotificationView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct NotificationView: View {
  var body: some View {
    NavigationStack {
      ScrollView {
        LazyVStack(spacing: 24) {
          ForEach(0..<10) { notification in
            NotificationCell()
          }
        }
      }
      .navigationTitle("Notification")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

#Preview {
  NotificationView()
}
