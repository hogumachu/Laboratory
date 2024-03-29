import Foundation

@freestanding(expression)
public macro localizing(_ string: String) -> String = #externalMacro(module: "LocalizedMacroMacros", type: "LocalizingMacro")
