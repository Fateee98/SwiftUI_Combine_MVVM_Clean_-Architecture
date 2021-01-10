//
//  NavigationHelper.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 09/01/2021.
//

import Foundation
import SwiftUI

extension View {
    func withNavigation<T: View>(to destination: T) -> some View {
        background(destination)
    }
}

struct NavigationButton<CV: View, NV: View>: View {
    @State private var isNavigation = false
    
    var contentView: CV
    var navigationView: (Binding<Bool>) -> NV
    
    var body: some View {
        Button(action: {
            self.isNavigation = true
        }) {
            contentView
                .withNavigation(to: navigationView($isNavigation))
        }
    }
}

struct ModalLinkWrapper<T: View>: View {
    typealias DestinationView = T
    
    var destination: T
    @Binding var isPresented: Bool
    
    var body: some View {
        EmptyView()
            .sheet(isPresented: $isPresented, content: {
                self.destination
            })
    }
}

struct NavigationLinkWrapper<T: View>: View {
    typealias DestinationView = T
    
    var destination: T
    @Binding var isPush: Bool
    var isDetailLink: Bool = true
    
    var body: some View {
        NavigationLink(destination: destination, isActive: $isPush) {
            EmptyView()
        }.isDetailLink(isDetailLink)
    }
}
