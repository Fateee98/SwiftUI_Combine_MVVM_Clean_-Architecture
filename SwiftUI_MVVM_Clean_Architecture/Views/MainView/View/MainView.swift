//
//  MainView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import SwiftUI

struct MainView<T: ViewModelProtocol>: View {
    
    @ObservedObject private var viewModel: T
    
    init(viewModel: T) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Button(action: {
            
        }) {
            Text("Button title")
        }
    }
}

//extension MainView: BindableType {
//    func bindViewModel() {
//
//    }
//}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(viewModel: <#_#>)
//    }
//}
