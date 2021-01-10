//
//  MainViewCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI

protocol MainRouteProtocol: Coordinator {}

public enum MainViewRoute: ViewRouteEnum {
    case detail
    case detailRed
}

extension MainRouteProtocol {
    
    func prepareTransition(for screen: MainViewRoute, isTransaction: Binding<Bool>) -> AnyView {
        switch screen {
        case .detail:
            let coordinator = DetailViewCoordinator<C>(isPush: isTransaction)
            return AnyView(coordinate(to: coordinator))
        default:
            return AnyView(EmptyView())
        }
    }
}

//final class NavigationMainCoordinator<C: Coordinator>: MainRouteProtocol {
//    private var isNavigation: Binding<Bool>
//
//    init(isNavigation: Binding<Bool>) {
//        self.isNavigation = isNavigation
//    }
//
//    @discardableResult
//    func start() -> AnyView {
//
//    }
//}
