
import UIKit

@dynamicMemberLookup
public struct Flex<Base> {
    
    private let base: Base
    
    public init(_ base: Base) {
        self.base = base
    }
    
    public subscript<Value>(dynamicMember keyPath: WritableKeyPath<Base, Value>) -> (Value) -> Flex<Base> {
        return { [base] value in
            var obj = base
            obj[keyPath: keyPath] = value
            return Flex(obj)
        }
    }
    
    public func toStiff() -> Base {
        return base
    }
    
    /// https://github.com/devxoul/Then/blob/master/Sources/Then/Then.swift
    public func `do`(_ block: (Base) throws -> Void) rethrows {
        try block(base)
    }
    
    public func with(_ block: (inout Base) throws -> Void) rethrows -> Self {
        var obj = base
        try block(&obj)
        return Flex(obj)
    }
    
}

public protocol Flexible {}

public extension Flexible where Self: Any {
    
    func toFlexible() -> Flex<Self> {
        return Flex(self)
    }
    
}

extension NSObject: Flexible {}
