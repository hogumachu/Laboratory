//
//  Client.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

final class Client {
    
    let id: UUID
    let socket: WebSocket
    
    init(id: UUID, socket: WebSocket) {
        self.id = id
        self.socket = socket
    }
    
}
