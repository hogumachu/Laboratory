//
//  ContentView.swift
//  RetroactiveSample
//
//  Created by 홍성준 on 4/4/25.
//

import DesignSystem
import Detail
import Entity
import Home
import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      BadgeView(Sports.baseball)
      BadgeView(Sports.basketball)
      BadgeView(Sports.football)
    }
    .padding()
  }
}
