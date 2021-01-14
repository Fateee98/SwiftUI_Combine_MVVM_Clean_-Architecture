//
//  MainViewCoordinator.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI
import Combine

public enum MainRounte: BaseNavigatorEnum {
    case detail
    case detailRed
}

final class MainViewCoordinator: BaseNavigatorRoute<MainRounte> {
    
    override func prepareTransition(for route: MainRounte) {
        switch route {
        case .detail:
            navigation?.pushView(AnyView(DetailView(viewModel: DetailViewModel())))
        default: break
        }
    }
}
