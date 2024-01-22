//
//  Message.swift
//  ChatApp-iOS
//
//  Created by 홍성준 on 1/22/24.
//

import Foundation

struct Message<T: Codable>: Codable {
    let id: UUID
    let data: T
}
