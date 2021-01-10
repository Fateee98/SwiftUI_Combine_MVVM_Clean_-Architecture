//
//  SwiftUI_MVVM_Clean_ArchitectureApp.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

//@main
//struct SwiftUI_MVVM_Clean_ArchitectureApp: App {
//
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//    var body: some Scene {
//        WindowGroup {
//            MainView(viewModel: <#_#>)
//        }
//    }
//}

//MARK: - AppDelegate
@UIApplicationMain
final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
}

//MARK: - SceneDelegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: Navigation?
//    var coordinator: AppCoordinator?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let viewModel = MainViewModel()
        let mainView = NavigationView { MainView(viewModel: viewModel) }
        
        if let windowScene = scene as? UIWindowScene {
            let rootWindow = UIWindow(windowScene: windowScene)
            let navigation = Navigation(window: rootWindow)
            let rootView = UIHostingController(rootView: mainView.environmentObject(navigation))

            rootWindow.rootViewController = rootView

            self.window = rootWindow
            self.navigation = navigation
            rootWindow.makeKeyAndVisible()
//            let coordinator = AppCoordinator(window: window)
//            coordinator.start()
//            self.window = window
//            self.coordinator = coordinator
        }
    }
}

