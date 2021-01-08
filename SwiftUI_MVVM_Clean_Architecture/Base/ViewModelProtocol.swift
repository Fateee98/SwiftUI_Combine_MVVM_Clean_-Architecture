//
//  ViewModelProtocol.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 08/01/2021.
//

import Foundation

protocol ViewModelProtocol: ObservableObject {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}
