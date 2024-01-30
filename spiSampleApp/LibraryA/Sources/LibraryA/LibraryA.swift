import Foundation

@_spi(Testing) public struct SomeConfiguration {
    public let version: String
    public let identifier: String
    public init(version: String, identifier: String) {
        self.version = version
        self.identifier = identifier
    }
}

public final class SomeClass {
    
    /// Internal property cannot be declared '@_spi' because only public and open declarations can be '@_spi'
    // @_spi(Testing) internal var configuration: SomeConfiguration = .init(version: "1.0.0", identifier: "SomeClass")
    
    /// Private property cannot be declared '@_spi' because only public and open declarations can be '@_spi'
    // @_spi(Testing) private var configuration: SomeConfiguration = .init(version: "1.0.0", identifier: "SomeClass")
    
    @_spi(Testing) public var configuration: SomeConfiguration = .init(version: "1.0.0", identifier: "SomeClass")
    
    public init() {}
    
    public func version() -> String {
        return configuration.version
    }
    
    public func identifier() -> String {
        return configuration.identifier
    }
    
}
