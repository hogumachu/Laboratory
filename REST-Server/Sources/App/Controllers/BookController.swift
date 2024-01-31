//
//  BookController.swift
//
//
//  Created by 홍성준 on 1/31/24.
//

import Fluent
import Vapor

protocol BookControllable: RouteCollection {
    func create(req: Request) async throws -> Book
    func read(req: Request) async throws -> Page<Book>
    func update(req: Request) async throws -> Book
    func delete(req: Request) async throws -> HTTPStatus
}

struct BookController: BookControllable {
    
    func boot(routes: RoutesBuilder) throws {
        let books = routes.grouped("books")
        books.post(use: create)
        books.get(use: read)
        books.put(use: update)
        books.group(":bookID") { book in
            book.delete(use: delete)
        }
    }
    
    func create(req: Request) async throws -> Book {
        let book = try req.content.decode(Book.self)
        try await book.save(on: req.db)
        return book
    }
    
    func read(req: Request) async throws -> Page<Book> {
        return try await Book.query(on: req.db)
            .paginate(for: req)
    }
    
    /// PUT: 자원의 전체 교체
    func update(req: Request) async throws -> Book {
        let book = try req.content.decode(Book.self)
        try await book.update(on: req.db)
        return book
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let book = try await Book.find(req.parameters.get("bookID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await book.delete(on: req.db)
        return .ok
    }
    
}
