//
//  BadgeView.swift
//  Shared
//
//  Created by 홍성준 on 4/4/25.
//

import SwiftUI

public protocol Badgeable {
  var title: String { get }
  var foregroundColor: Color { get }
  var backgroundColor: Color { get }
  var font: Font { get }
  var verticalSpacing: CGFloat { get }
  var horizontalSpacing: CGFloat { get }
  var cornerRadius: CGFloat { get }
}

public extension Badgeable {
  var font: Font { .callout }
  var verticalSpacing: CGFloat { 6 }
  var horizontalSpacing: CGFloat { 8 }
  var cornerRadius: CGFloat { 8 }
}

public struct BadgeView<Badge>: View where Badge: Badgeable {
  
  private let badge: Badge
  
  public init(_ badge: Badge) {
    self.badge = badge
  }
  
  public var body: some View {
    Text(badge.title)
      .font(badge.font)
      .foregroundColor(badge.foregroundColor)
      .padding(.vertical, badge.verticalSpacing)
      .padding(.horizontal, badge.horizontalSpacing)
      .background(
        RoundedRectangle(cornerRadius: badge.cornerRadius)
          .foregroundStyle(badge.backgroundColor)
      )
  }
  
}
