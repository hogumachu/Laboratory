import Vapor

func routes(_ app: Application, controller: ChatController) throws {
    try ChatRouter.routes(using: app, controller: controller)
}
