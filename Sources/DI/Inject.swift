//  Copyright © 2023 Martin Mlostek. All rights reserved.

import Foundation

/// Inject a simple object without connectivity to combine or swiftUI
@propertyWrapper
public struct Inject<TYPE> {

    public private(set) var wrappedValue: TYPE

    public init() {
        wrappedValue = DependencyResolver.shared.resolve()
    }
}
