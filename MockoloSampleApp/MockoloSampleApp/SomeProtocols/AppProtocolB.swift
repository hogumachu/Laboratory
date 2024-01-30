//
//  AppProtocolB.swift
//  MockoloSampleApp
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

/// @mockable
protocol AppProtocolB: AnyObject {
    var float: Float { get set }
    func isDoSomething() -> Bool
}
