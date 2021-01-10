//
//  Navigation.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 10/01/2021.
//

import Foundation
import SwiftUI

open class Navigation: ObservableObject {
    public let window: UIWindow
    private var navigationController: UINavigationController?

    public init(window: UIWindow) {
        self.window = window
    }

    public func present(_ view: AnyView, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        present(controller, animated: animated)
    }

    public func present(_ viewController: UIViewController, animated: Bool = true) {
        window.rootViewController?.present(viewController, animated: animated)
    }
    
    public func presentWithNavigation(_ view: AnyView, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        navigationController = UINavigationController(rootViewController: controller)
        if let navigationController = navigationController {
            present(navigationController, animated: animated)
        }
    }
    
    public func pushWithCustomNavigationController(_ view: AnyView, animated: Bool = true) {
        if let navigationController = navigationController {
            let controller = DestinationHostingController(rootView: view.environmentObject(self))
            navigationController.pushViewController(controller, animated: animated)
        }
    }

    public func pushView(_ view: AnyView, animated: Bool = true) {
        let controller = DestinationHostingController(rootView: view.environmentObject(self))
        pushViewController(controller, animated: animated)
    }

    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        let nvc = window.rootViewController?.children.first?.children.first as? UINavigationController
        nvc?.pushViewController(viewController, animated: animated)
    }
}

