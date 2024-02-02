//
//  ProfileHeaderView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct ProfileHeaderView: View {
  var body: some View {
    VStack(spacing: 16) {
      VStack(spacing: 8){
        Image(systemName: "person.circle.fill")
          .resizable()
          .frame(width: 80, height: 80)
          .foregroundStyle(Color(.systemGray5))
        
        Text("User Name")
          .font(.subheadline)
          .fontWeight(.semibold)
      }
      
      HStack(spacing: 16) {
        UserStatView(value: 5, title: "following")
        UserStatView(value: 1, title: "followers")
        UserStatView(value: 7, title: "likes")
      }
      
      Button {
        
      } label: {
        Text("Edit Profile")
          .font(.subheadline)
          .fontWeight(.semibold)
          .frame(width: 360, height: 32)
          .foregroundStyle(.black)
          .background(Color(.systemGray6))
          .clipShape(RoundedRectangle(cornerRadius: 6))
      }
      
      Divider()
    }
  }
}

#Preview {
  ProfileHeaderView()
}
