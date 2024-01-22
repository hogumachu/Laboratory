//
//  ChatRouter.swift
//
//
//  Created by 홍성준 on 1/22/24.
//

import Vapor

enum ChatRouter {
    
    static func routes(using app: Application, controller: ChatController) throws {
        app.webSocket("echo") { _, ws in
            controller.connect(ws: ws)
        }
    }
    
}
