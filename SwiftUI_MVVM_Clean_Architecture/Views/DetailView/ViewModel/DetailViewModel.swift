//
//  DetailViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import Foundation

final class DetailViewModel<C: Coordinator> {
    
    private(set) weak var router: C?
    
    init(router: C) {
        self.router = router
    }
    
}

extension DetailViewModel: ViewModelProtocol {
//    struct Input {
//    }
//    
//    struct Output {
//    }
//    
//    func transform(input: Input) -> Output {
//        return Output()
//    }
}
