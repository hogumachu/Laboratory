//
//  UI+Test.swift
//  UITestSampleAppTests
//
//  Created by 홍성준 on 1/28/24.
//

import UIKit

extension UIView {
    
    func search<T: UIView>(type: T.Type, accessibilityIdentifier: String) -> T? {
        for subview in subviews {
            if subview.accessibilityIdentifier == accessibilityIdentifier {
                return subview as? T
            } else {
                if let view = subview.search(type: type, accessibilityIdentifier: accessibilityIdentifier) {
                    return view
                }
            }
        }
        return nil
    }
    
}

enum UITestError: Error {
    case emptyAccessibilityIdentifier
}

extension UIViewController {
    
    func search<T: UIView>(type: T.Type, accessibilityIdentifier: String) throws -> T {
        if let result = view.search(type: type, accessibilityIdentifier: accessibilityIdentifier) {
            return result
        } else {
            throw UITestError.emptyAccessibilityIdentifier
        }
    }
    
}
