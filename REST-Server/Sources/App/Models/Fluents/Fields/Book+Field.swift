//
//  Book+Field.swift
//
//
//  Created by 홍성준 on 1/31/24.
//

import Fluent

extension Book {
    
    enum BookField {
        static let schema = "books"
        static let id = FieldKey(stringLiteral: "id")
        static let name = FieldKey(stringLiteral: "name")
        static let author = FieldKey(stringLiteral: "author")
    }
    
}
