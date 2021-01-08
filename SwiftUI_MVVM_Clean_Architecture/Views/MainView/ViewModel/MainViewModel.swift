//
//  MainViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation

final class MainViewModel<C: Coordinator> {
    
    private(set) weak var router: C?
    
    init(router: C) {
        self.router = router
    }
    
}

extension MainViewModel: ViewModelProtocol {
    struct Input {
    }
    
    struct Output {
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
