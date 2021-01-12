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
    private var currentNavigationController: UINavigationController?

    public init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Present
    public func presentOnRoot(_ view: AnyView, animated: Bool = true) {
        let viewController = DestinationHostingController(rootView: view.environmentObject(self))
        window.rootViewController?.present(viewController, animated: true)
    }
    
    public func presentWithNavigation(_ view: AnyView, animated: Bool = true) {
        let destinationController = DestinationHostingController(rootView: view.environmentObject(self))
        currentNavigationController = UINavigationController(rootViewController: destinationController)
        if let navigationController = currentNavigationController {
            window.rootViewController?.present(navigationController, animated: animated)
        }
    }
    
    //MARK: - Push
    public func pushView(_ view: AnyView, animated: Bool = true) {
        let destinationViewController = DestinationHostingController(rootView: view.environmentObject(self))
        pushViewController(destinationViewController)
    }
    
    public func pushViewController(_ viewController: UIViewController, animated: Bool = true) {
        let currentNavigationViewController = window.rootViewController?.children.first?.children.first as? UINavigationController
        currentNavigationController = currentNavigationViewController
        currentNavigationController?.pushViewController(viewController, animated: animated)
    }
    
    //MARK: - Pop
    public func popView(animated: Bool = true) {
        currentNavigationController?.popViewController(animated: animated)
    }
    
    public func popToRootView(animated: Bool = true) {
        currentNavigationController?.popToRootViewController(animated: animated)
    }
}

