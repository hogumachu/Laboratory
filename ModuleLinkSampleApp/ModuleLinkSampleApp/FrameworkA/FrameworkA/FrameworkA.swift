//
//  FrameworkA.swift
//  FrameworkA
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation
import StaticLibraryA

public enum FrameworkA {
    
    public static func log() {
        print(self, #function)
        StaticLibraryA.log()
    }
    
}
