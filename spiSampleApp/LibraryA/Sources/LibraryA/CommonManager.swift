//
//  CommonManager.swift
//
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

public final class CommonManager {
    
    public static let shared = CommonManager()
    
    private var version = "1.0.0"
    private var isAuthorized = true
    
    private init() {}
    
    public func isValidVersion(version: String) -> Bool {
        return version == self.version
    }
    
    public func requestAuthorization() -> Bool {
        return isAuthorized
    }
    
}
