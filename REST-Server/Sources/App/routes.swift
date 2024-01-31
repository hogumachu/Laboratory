import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("healthcheck") { req async -> String in
        "Hello, world! \(Date.now.ISO8601Format())"
    }

    try app.register(collection: BookController())
}
