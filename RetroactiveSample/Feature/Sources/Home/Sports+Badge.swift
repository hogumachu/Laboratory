//
//  Sports+Badge.swift
//  Feature
//
//  Created by 홍성준 on 4/4/25.
//

import DesignSystem
import Entity
import SwiftUI

extension Sports: @retroactive Badgeable {
  public var title: String { "From Home Module: \(rawValue)" }
  public var foregroundColor: Color { .pink }
  public var backgroundColor: Color { .gray }
}
