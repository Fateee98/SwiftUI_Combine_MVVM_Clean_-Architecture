//
//  DummyAPIRouter.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation

private let appID = "5ffd4d92d9f472640f31e58c"

public enum DummyAPIRouter: BaseRouter {
    case getUserList
    case getFullUser(userID: String)
    
    var path: String {
        switch self {
        case .getUserList:
            return "/user"
        case let .getFullUser(userID):
            return "/user/\(userID)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    func asURLRequest() -> URLRequest {
        let url = ApiConfig.url
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(appID, forHTTPHeaderField: "app-id")
        return request
    }
}
