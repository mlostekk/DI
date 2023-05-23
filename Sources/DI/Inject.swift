//  Copyright © 2023 Martin Mlostek. All rights reserved.

import Foundation

/// Use this property wrapper to resolve property based dependencies
@propertyWrapper
public struct Inject<TYPE> {

    public var wrappedValue: TYPE {
        get {
            value
        }
        set {
            value = newValue
        }
    }

    private var value: TYPE

    public init() {
        value = DependencyResolver.shared.resolve()
    }
}
