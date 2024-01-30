//
//  AppProtocolC.swift
//  MockoloSampleApp
//
//  Created by 홍성준 on 1/30/24.
//

import Foundation

/// @mockable
protocol AppProtocolC: AnyObject {
    var name: Int { get set }
    func isMyName(name: String) -> Bool
}
