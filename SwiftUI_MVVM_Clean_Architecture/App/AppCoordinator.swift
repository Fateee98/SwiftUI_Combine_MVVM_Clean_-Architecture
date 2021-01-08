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
    func start() -> some View {
        let coordinator = MainViewCoordinator<AppCoordinator>(window: window)
        return coordinate(to: coordinator)
    }
}
