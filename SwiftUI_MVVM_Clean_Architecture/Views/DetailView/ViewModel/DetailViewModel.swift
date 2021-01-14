//
//  DetailViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import Foundation
import SwiftUI
import Combine

protocol DetailViewModelProtocol: ViewModelProtocol {}

final class DetailViewModel {
    
    struct DetailViewState {
        var listUser: [UserModel]
    }

    struct DetailViewInput {
        let callAPI = PassthroughSubject<Void, Error>()
    }
    
    @Published var state: DetailViewState
    private var disposeStore = Set<AnyCancellable>()
    
    init() {
        self.state = DetailViewState(listUser: [UserModel]())
    }
}

extension DetailViewModel: ViewModelProtocol {
    
    func transform(_ input: DetailViewInput) {
        input.callAPI
            .flatMap { _ in DummyServices.shared.requestDummyAPI()}
            .sink { (state) in
                print(state)
            } receiveValue: { [weak self] (data) in
                if let weakSelf = self {
                    weakSelf.state.listUser = data.data ?? []
                }
            }.store(in: &disposeStore)

    }
}
