//
//  DetailViewCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import Foundation
import SwiftUI

final class DetailViewCoordinator<C: Coordinator>: Coordinator {
    
    private let isPush: Binding<Bool>
    
    init(isPush: Binding<Bool>) {
        self.isPush = isPush
    }
    
    @discardableResult
    func start() -> some View {
        let view = make(router: self)
        return NavigationLinkWrapper(destination: view, isPush: isPush)
    }
    
    private func make<C: Coordinator>(router: C) -> some View {
        let viewModel = DetailViewModel(router: router)
        let view = DetailView(viewModel: viewModel)
        return view
    }
}
