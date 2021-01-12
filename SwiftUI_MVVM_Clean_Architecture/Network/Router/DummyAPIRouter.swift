//
//  DummyAPIRouter.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation
import Alamofire

private let appID = "5ffd4d92d9f472640f31e58c"

public enum DummyAPIRouter: URLRequestConvertible {
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
    
    var method: HTTPMethod {
        return .get
    }
    
    var parameters: [String: Any] {
        return [:]
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = ApiConfig.url
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.setValue(appID, forHTTPHeaderField: "app-id")
        
        if method == .get {
            return try! URLEncoding.queryString.encode(request, with: self.parameters)
        } else if method == .post {
            return try! JSONEncoding.default.encode(request, with: self.parameters)
        }
        
        return request
    }
}
