//
//  NavigatorRoute.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation
import Combine
import SwiftUI

protocol BaseNavigatorEnum {}

class BaseNavigatorRoute<BE: BaseNavigatorEnum> {
    
    //MARK: - Properties
    private let triggerTransition = PassthroughSubject<BE, Never>()
    private var disposeStore = Set<AnyCancellable>()
    
    init() {
        triggerTransition
            .receive(on: DispatchQueue.main)
            .sink { [weak self] routeType in
                self?.prepareTransition(for: routeType)
            }.store(in: &disposeStore)
    }
    
    //MARK: - Action
    public func trigger(_ route: BE) {
        self.triggerTransition.send(route)
    }
    
    open func prepareTransition(for route: BE) {
        fatalError("Please override the \(#function) method.")
    }
}
