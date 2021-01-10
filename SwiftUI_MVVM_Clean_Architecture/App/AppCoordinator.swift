//
//  AppCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

final class AppCoordinator: Coordinator {
    typealias C = AppCoordinator
    
    weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    deinit {
        print("⚠️ deinit AppCoordinator \(identifier)")
    }
    
    @discardableResult
    func start() -> AnyView {
        let coordinator = RootViewCoordinator<AppCoordinator>(window: window)
        return AnyView(coordinate(to: coordinator))
    }
}

final class RootViewCoordinator<C: Coordinator>: MainRouteProtocol {
    
    weak var window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
    }
    
    deinit {
        print("deinit cordinator \(identifier)")
    }
    
    @discardableResult
    func start() -> AnyView {
//        let view = make(router: self)
//        let navigation = NavigationView { view }
//        let hosting = UIHostingController(rootView: navigation)
//        window?.rootViewController = hosting
//        window?.makeKeyAndVisible()
        return AnyView(EmptyView())
    }
    
//    func make<C: MainRouteProtocol>(router: C) -> AnyView {
//        let viewModel = MainViewModel<C>(router: router)
//        let view = MainView(viewModel: viewModel)
//        return AnyView(view)
//    }
}
