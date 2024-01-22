//
//  WebSocket+.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

extension WebSocket {
    
    func send(_ data: Encodable) {
        let encoder = JSONEncoder()
        let data = try! encoder.encode(data)
        send([UInt8](data))
    }
    
}
