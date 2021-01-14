//
//  DetailView.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/9/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @ObservedObject private var viewModel: DetailViewModel
    private let input = DetailViewModel.DetailViewInput()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        self.viewModel.transform(input)
    }
    
    var body: some View {
        VStack {
            List(self.viewModel.state.listUser) { user in
                UserRow(url: .constant(user.picture ?? ""), firstName: .constant(user.firstName ?? ""), lastName: .constant(user.lastName!), email: .constant(user.email ?? ""))
            }
            Spacer()
            Button(action: {
                navigation?.popToRootView()
            }) {
                Text("Detail View")
            }
            Spacer()
        } .onAppear() {
            self.input.callAPI.send(())
        }
    }
}

struct UserRow: View {
    
    @Binding var url: String
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    
    var body: some View {
        HStack {
            Spacer() .frame(width: 15)
            WebImage(url: URL(string: url))
                .resizable()
                .placeholder {Rectangle().foregroundColor(.gray)}
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFit()
                .frame(width: 100, height: 100)
            VStack {
                Text("\(lastName) \(firstName)")
                Text(email)
            }
            Spacer()
        }
    }
}
