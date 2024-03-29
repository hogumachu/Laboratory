//
//  String+Localized.swift
//
//
//  Created by 홍성준 on 3/29/24.
//

import Foundation

public extension String {
  
  /// Localizable 파일은 Package에 리소스로 설정하지 않아도 OK
  
  func localized() -> String {
    return String(
      localized: .init(self),
      bundle: .module
    )
  }
  
  func localized(_ bundle: Bundle) -> String {
    return String(
      localized: .init(self),
      bundle: bundle
    )
  }
  
}
