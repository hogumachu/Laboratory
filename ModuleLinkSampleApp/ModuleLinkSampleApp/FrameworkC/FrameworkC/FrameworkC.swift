//
//  FrameworkC.swift
//  FrameworkC
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation
import PackageC

public enum FrameworkC {
    public static func log() {
        print(self, #function)
        PackageC.log()
    }
}
