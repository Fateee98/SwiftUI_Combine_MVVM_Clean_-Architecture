//
//  MainView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var navigation: Navigation
    @ObservedObject private var viewModel: MainViewModel
    private let input: MainInput
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        self.input = MainInput()
        self.viewModel.transform(self.input)
    }
    
    var body: some View {
        VStack {
            Text(self.viewModel.state.text)
                .font(.headline)
            Button(action: {
                self.input.publisher.send("Test value")
            }) {
                Text("Tap here").foregroundColor(Color.blue)
            }
            Button(action: {
//                self.input.push.send(())
                self.navigation.pushView(AnyView(DetailView(viewModel: DetailViewModel())))
            }) {
                Text("Tap here to push").foregroundColor(Color.blue)
            }
//            NavigationButton(contentView: Text("Push to detail"),
//                             navigationView: { isNavigation in
//                                self.viewModel.router?.prepareTransition(for: .detail, isTransaction: isNavigation)
//                             })
//                .foregroundColor(Color.blue)
        } 
    }
}
