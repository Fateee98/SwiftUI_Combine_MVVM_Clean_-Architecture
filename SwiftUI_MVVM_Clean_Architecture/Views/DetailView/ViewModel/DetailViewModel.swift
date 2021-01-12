//
//  DetailViewModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import Foundation
import SwiftUI

protocol DetailViewModelProtocol: ViewModelProtocol {}

final class DetailViewModel {
    
    struct DetailViewState {
    }

    enum DetailViewInput {
        case pop
    }
    
    @Published var state: DetailViewState
    
    init() {
        self.state = DetailViewState()
    }
    
}

extension DetailViewModel: ViewModelProtocol {
    
    func transform(_ input: DetailViewInput) {
        
    }
}
