//
//  Book.swift
//
//
//  Created by 홍성준 on 1/31/24.
//

import Fluent
import Vapor

final class Book: Model, Content {
    
    static let schema = BookField.schema
    
    @ID
    var id: UUID?
    
    @Field(key: BookField.name)
    var name: String
    
    @Field(key: BookField.author)
    var author: String
    
}
