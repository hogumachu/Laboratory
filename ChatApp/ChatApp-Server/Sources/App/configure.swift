import Vapor

public func configure(_ app: Application) async throws {
    let controller = ChatController(eventLoop: app.eventLoopGroup.next())
    try routes(app, controller: controller)
}
