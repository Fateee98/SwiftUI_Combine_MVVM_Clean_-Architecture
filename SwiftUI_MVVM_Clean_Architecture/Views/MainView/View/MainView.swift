//
//  MainView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

struct MainView: View {
    @ObservedObject private var viewModel: MainViewModel
    private let input: MainViewModel.MainInput
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        self.input = MainViewModel.MainInput()
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
                self.input.push.send(())
            }) {
                Text("Tap here to push").foregroundColor(Color.blue)
            }
        }
    }
    
}
