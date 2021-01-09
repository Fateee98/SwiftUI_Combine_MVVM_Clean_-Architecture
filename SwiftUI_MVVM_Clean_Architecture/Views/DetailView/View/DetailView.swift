//
//  DetailView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import SwiftUI

struct DetailView<T: ViewModelProtocol>: View {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button(action: {
            
        }) {
            Text("Detail View")
        }
    }
}
