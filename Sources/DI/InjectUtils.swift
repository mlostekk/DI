//  Copyright © 2023 Martin Mlostek. All rights reserved.

import Foundation

/// Collection of DI utils
public class InjectUtils {

    /// Helper function to load achieve similar readability as koin on Android
    public static func loadModules(_ resolver: DependencyResolver.ModuleDeclaration) {
        resolver(DependencyResolver.shared)
    }

}