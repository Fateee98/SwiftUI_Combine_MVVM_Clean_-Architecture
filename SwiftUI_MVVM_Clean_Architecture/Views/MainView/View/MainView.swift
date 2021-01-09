//
//  MainView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

struct MainView<T: MainViewModelProtocol>: View {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Group {
            NavigationButton(contentView: Text("Push to detail"),
                             navigationView: { isPresented in
                                self.viewModel.onTapButton(isPush: isPresented)
                             })
                .foregroundColor(Color.blue)
        }
    }
}
