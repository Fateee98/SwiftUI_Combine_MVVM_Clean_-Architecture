//
//  BaseRequest.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation
import Combine

public enum Method: String {
    case get = "GET"
    case post = "POST"
}

protocol BaseRouter {
    var path: String { get }
    var method: Method { get }
    var parameters: [String: Any] { get }
    
    func asURLRequest() -> URLRequest
}

let kRequestTimeOut: TimeInterval = 60
let kMessageRequestServerFaild = "Có lỗi xảy ra, vui lòng thử lại sau!"

struct NetworkManager {
    static let manager: URLSession = {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = kRequestTimeOut
            config.timeoutIntervalForResource = kRequestTimeOut
            config.httpMaximumConnectionsPerHost = 10
            return config
        }()
        let manager = URLSession(configuration: configuration)
        return manager
    }()
}

open class BaseRequest: NSObject {
    let manager = NetworkManager.manager
    
    func cancelTaskWithUrl(_ url: URL) {
        manager.getAllTasks { tasks in
            tasks
                .filter { $0.state == .running }
                .filter { $0.originalRequest?.url == url }.first?
                .cancel()
        }
    }
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, Error> {
        return manager
            .dataTaskPublisher(for: request)
            .tryMap { result -> T in
                let value = try decoder.decode(T.self, from: result.data)
                return value
            }
            .eraseToAnyPublisher()
    }
}
