//
//  MainViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI
import Combine

protocol MainViewModelProtocol: ViewModelProtocol {}

final class MainViewModel {
    
    struct MainViewState {
        var text: String
        var pushToDetail: AnyView
        var isPushDetail: Void
    }
    
    struct MainInput {
        let publisher = PassthroughSubject<String, Never>()
        let push = PassthroughSubject<Void, Never>()
    }
    
    @Published var state: MainViewState
    
    private var disposeStore = Set<AnyCancellable>()
    
    private var router: BaseNavigatorRoute<MainRounte>
    
    init(router: BaseNavigatorRoute<MainRounte>) {
        self.router = router
        self.state = MainViewState(text: "",
                                   pushToDetail: AnyView(EmptyView()),
                                   isPushDetail: ())
    }
}

extension MainViewModel: MainViewModelProtocol {
    func transform(_ input: MainInput) {
        input.publisher
            .sink { (text) in
                print(text)
                self.state.text = text
            }.store(in: &disposeStore)
        
        input.push
            .sink { [weak self] _ in
                self?.router.trigger(.detail)
            }.store(in: &disposeStore)
    }
}
