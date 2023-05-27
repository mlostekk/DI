//  Copyright © 2023 Martin Mlostek. All rights reserved.

import Foundation
import SwiftUI

/// Inject an observable object as dynamic property. This means whenever the underlying object
/// changes, the views body will be updated as the internal value is an observable object itself
/// In order to extract @Published variables from the wrappedValue and use them as bindings, use
/// the following approach
///
///     class MyViewModel: ObservableObject {
///         @Published var viewState: MyViewState = ...
///     }
///
///     struct SubView: View {
///         @Binding var viewState: MyViewState
///     }
///
///     struct MainView: View {
///         @InjectObservable private var viewModel: MyViewModel
///
///         var body: some View {
///             VStack {
///                 SubView(viewState: _viewModel.$wrappedValue.viewState)
///             }
///         }
///     }
///
@propertyWrapper
public struct InjectObservable<TYPE>: DynamicProperty where TYPE: ObservableObject {

    @ObservedObject
    public private(set) var wrappedValue: TYPE

    public init() {
        wrappedValue = DependencyResolver.shared.resolve()
    }
}