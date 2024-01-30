//
//  LibraryProtocolA.swift
//
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

/// @mockable
public protocol LibraryProtocolA: AnyObject {
    func name() -> String
    func version() -> String
}
