//  Copyright © 2023 Martin Mlostek. All rights reserved.

import Foundation
import SwiftUI

@propertyWrapper
public struct InjectObject<TYPE>: DynamicProperty where TYPE: ObservableObject {
    public var wrappedValue: TYPE {
        get {
            value
        }
        set {
            value = newValue
        }
    }

    @ObservedObject
    private var value: TYPE

    public init() {
        value = DependencyResolver.shared.resolve()
    }
}