//
//  ViewModelProtocol.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation
import SwiftUI

protocol ViewModelProtocol: ObservableObject where ObjectWillChangePublisher.Output == Void {
    associatedtype State
    associatedtype Input
    
    var state: State { get }
    func transform(_ input: Input)
}
