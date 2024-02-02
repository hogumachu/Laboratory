//
//  NotificationCell.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct NotificationCell: View {
  var body: some View {
    HStack {
      Image(systemName: "person.circle.fill")
        .resizable()
        .frame(width: 30, height: 30)
        .foregroundStyle(Color(.systemGray5))
      
      HStack {
        Text("User Name")
          .font(.footnote)
          .fontWeight(.semibold) +
        
        Text(" liked one of your posts. ")
          .font(.footnote) +
        
        Text("3d")
          .font(.caption)
          .foregroundStyle(.gray)
      }
      
      Spacer()
      
      Rectangle()
        .frame(width: 48, height: 48)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
    .padding(.horizontal)
  }
}

#Preview {
  NotificationCell()
}
