//
//  AppProtocolA.swift
//  MockoloSampleApp
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

/// @mockable
protocol AppProtocolA: AnyObject {
    var num: Int { get set }
    func doSomething()
}
