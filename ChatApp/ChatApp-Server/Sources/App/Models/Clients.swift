//
//  Clients.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

final class Clients {
    
    var eventLoop: EventLoop
    var storage: [UUID: Client]
    
    var active: [Client] {
        storage.values.filter { $0.socket.isClosed }
    }
    
    init(eventLoop: EventLoop, storage: [UUID : Client]) {
        self.eventLoop = eventLoop
        self.storage = storage
    }
    
    func add(_ client: Client) {
        storage[client.id] = client
    }
    
    func remove(_ client: Client) {
        storage[client.id] = nil
    }
    
    func find(_ id: UUID) -> Client? {
        storage[id]
    }
    
    deinit {
        let futures = storage.values.map { $0.socket.close() }
        try! eventLoop.flatten(futures).wait()
    }
    
}
