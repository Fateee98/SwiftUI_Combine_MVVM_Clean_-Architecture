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

struct MainViewState {
    var text: String
    var pushToDetail: AnyView
    var isPushDetail: Void
}

struct MainInput {
    let publisher = PassthroughSubject<String, Never>()
    let push = PassthroughSubject<Void, Never>()
}

final class MainViewModel {
    @EnvironmentObject var navigation: Navigation
    @Published var state: MainViewState
    private var disposeStore = Set<AnyCancellable>()
    
    init() {
        self.state = MainViewState(text: "",
                                   pushToDetail: AnyView(EmptyView()),
                                   isPushDetail: ())
    }
}

extension MainViewModel: MainViewModelProtocol {
    func onNavigation(_ input: ViewRouteEnum, _ state: Binding<Bool>) -> AnyView {
        return AnyView(EmptyView())
    }
    
    
    func transform(_ input: MainInput) {
        input.publisher
            .sink { (text) in
                print(text)
                self.state.text = text
            }.store(in: &disposeStore)
        
        input.push
            .sink { _ in
                self.navigation.pushView(AnyView(DetailView(viewModel: DetailViewModel())))
            }.store(in: &disposeStore)
    }
}
