//
//  MainTabView.swift
//  SwiftUISample
//
//  Created by 홍성준 on 2/2/24.
//

import SwiftUI

struct MainTabView: View {
  @State private var selectedTab = 0
  
  var body: some View {
    TabView {
      FeedView()
        .tabItem {
          VStack {
            Image(systemName: selectedTab == 0 ? "house.fill" : "house")
              .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
            Text("Home")
          }
        }
        .onAppear { selectedTab = 0 }
      
      ExploreView()
        .tabItem {
          VStack {
            Image(systemName: selectedTab == 1 ? "person.2.fill" : "person.2")
              .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
            Text("Friends")
          }
        }
        .onAppear { selectedTab = 1 }
      
      Text("Add")
        .tabItem {
          VStack {
            Image(systemName: "plus")
          }
        }
        .onAppear { selectedTab = 2 }
      
      NotificationView()
        .tabItem {
          VStack {
            Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
              .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
            Text("Inbox")
          }
        }
        .onAppear { selectedTab = 3 }
      
      CurrentUserProfileView()
        .tabItem {
          VStack {
            Image(systemName: selectedTab == 4 ? "person.fill" : "person")
              .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
            Text("Profile")
          }
        }
        .onAppear { selectedTab = 4 }
    }
    .tint(.black)
  }
}

#Preview {
  MainTabView()
}
