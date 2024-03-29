//
//  SPIManager.swift
//
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

public final class SPIManager {
    
    public static let shared = SPIManager()
    
    @_spi(Testing) public var version = "1.0.0"
    @_spi(Testing) public var isAuthorized = true
    
    @_spi(Testing) public init(version: String = "1.0.0", isAuthorized: Bool = true) {
        self.version = version
        self.isAuthorized = isAuthorized
    }
    
    public func isValidVersion(version: String) -> Bool {
        return version == self.version
    }
    
    public func requestAuthorization() -> Bool {
        return isAuthorized
    }
    
}

final class MyClass {
    
    func update() {
        SPIManager.shared.version = "3" // can access same level
        SPIManager.shared.isAuthorized = false // can access same level
    }
    
}
