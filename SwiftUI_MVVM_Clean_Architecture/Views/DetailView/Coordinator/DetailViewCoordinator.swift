//
//  DetailViewCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import Foundation
import SwiftUI

public enum DetailViewRoute {
    case pop
}

protocol DetailViewRouteProtocol: Coordinator {}

extension DetailViewRouteProtocol {
    func triggerNavigation(screen: DetailViewRoute, isPush: Binding<Bool>) -> some View {
        let coordinator = DetailViewCoordinator<C>(isPush: isPush)
        return coordinate(to: coordinator)
    }
}

final class DetailViewCoordinator<C: Coordinator>: Coordinator {
    
    private let isPush: Binding<Bool>
    
    init(isPush: Binding<Bool>) {
        self.isPush = isPush
    }
    
    @discardableResult
    func start() -> AnyView {
//        let view = make(router: self)
//        return AnyView(NavigationLinkWrapper(destination: view, isPush: isPush))
        return AnyView(EmptyView())
    }
    
//    private func make<C: Coordinator>(router: C) -> some View {
//        let viewModel = DetailViewModel(router: router)
//        let view = DetailView(viewModel: viewModel)
//        return view
//    }
}
