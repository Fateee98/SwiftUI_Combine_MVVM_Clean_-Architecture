//
//  MainViewCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI

protocol MainRouteProtocol: Coordinator {}

public enum MainViewRoute {
    case detail
}

extension MainRouteProtocol {
    func triggerNavigation(screen: MainViewRoute, isPush: Binding<Bool>) -> some View {
        let coordinator = DetailViewCoordinator<C>(isPush: isPush)
        return coordinate(to: coordinator)
    }
}

final class MainViewCoordinator<C: Coordinator>: MainRouteProtocol {
    
    weak var window: UIWindow?
    
    public init(window: UIWindow?) {
        self.window = window
    }
    
    deinit {
        print("deinit cordinator \(identifier)")
    }
    
    @discardableResult
    func start() -> some View {
        let view = make(router: self)
        let navigation = NavigationView { view }
        let hosting = UIHostingController(rootView: navigation)
        window?.rootViewController = hosting
        window?.makeKeyAndVisible()
        return EmptyView()
    }
    
    func make<C: MainRouteProtocol>(router: C) -> some View {
        let viewModel = MainViewModel(router: router)
        let view = MainView(viewModel: viewModel)
        return view
    }
}
