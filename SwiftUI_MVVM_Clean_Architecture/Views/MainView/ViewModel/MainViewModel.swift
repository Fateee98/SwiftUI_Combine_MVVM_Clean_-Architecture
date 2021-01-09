//
//  MainViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI

protocol MainViewModelProtocol: ViewModelProtocol {
    associatedtype V: View
    func onTapButton(isPush: Binding<Bool>) -> V
}

final class MainViewModel<C: MainRouteProtocol> {
    
    private(set) weak var router: C?
    
    init(router: C) {
        self.router = router
    }
    
    public func onTapButton(isPush: Binding<Bool>) -> some View {
        return router?.triggerNavigation(screen: .detail, isPush: isPush)
    }
}

extension MainViewModel: MainViewModelProtocol {
    
//    func transform(input: Input) -> Output {
//        return Output()
//    }
}
