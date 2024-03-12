//
//  BaseTableView.swift
//  OSXSample
//
//  Created by 홍성준 on 3/13/24.
//

import AppKit

extension NSTableView {
  
  func register<T: NSTableCellView>(as: T.Type) {
    addTableColumn(.init(identifier: .init(String(describing: T.self))))
  }
  
  func dequeue<T: NSTableCellView>(for owner: Any?, as: T.Type) -> T? {
    return makeView(
      withIdentifier: .init(String(describing: T.self)),
      owner: owner
    ) as? T
  }
  
}
