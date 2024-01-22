//
//  Message.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

struct Message<T: Codable>: Codable {
    let id: UUID
    let data: T
}

extension ByteBuffer {
    func message<T: Codable>(_: T.Type) -> Message<T>? {
        return try? JSONDecoder().decode(Message<T>.self, from: self)
    }
}
