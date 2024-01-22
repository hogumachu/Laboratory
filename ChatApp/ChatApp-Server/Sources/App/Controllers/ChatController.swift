//
//  ChatController.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

final class ChatController {
    
    var clients: Clients
    
    init(eventLoop: EventLoop) {
        clients = .init(eventLoop: eventLoop, storage: [:])
    }
    
    func connect(ws: WebSocket) {
        ws.onBinary { [unowned self] ws, buffer in
            print("# A")
            if let message = buffer.message(Connect.self) {
                let client = Client(id: message.id, socket: ws)
                clients.add(client)
                notify(connect: message.data)
            }
            
            if let message = buffer.message(Chat.self) {
                notify(except: message.id, chat: message.data)
            }
        }
    }
    
    private func notify(connect: Connect) {
        clients.active.compactMap { $0 }
            .forEach { client in
                let message = Join(name: connect.name)
                let data = try! JSONEncoder().encode(message)
                client.socket.send([UInt8](data))
            }
    }
    
    private func notify(except id: UUID, chat: Chat) {
        clients.active.compactMap { $0 }
            .filter { $0.id != id }
            .forEach { client in
                let data = try! JSONEncoder().encode(chat)
                client.socket.send([UInt8](data))
            }
    }
    
}
