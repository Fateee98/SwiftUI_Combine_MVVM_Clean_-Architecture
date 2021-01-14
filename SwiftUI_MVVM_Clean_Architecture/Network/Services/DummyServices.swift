//
//  DummyServices.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Fate on 14/01/2021.
//

import Foundation
import Combine

open class DummyServices: BaseRequest {
    static let shared = DummyServices()
    
    func requestDummyAPI() -> AnyPublisher<ListUserModel, Error> {
        return self.run(DummyAPIRouter.getUserList.asURLRequest())
    }
}
