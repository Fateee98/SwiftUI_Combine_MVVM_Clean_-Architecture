//
//  BaseRequest.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation
import Combine
import Alamofire
import ObjectMapper

let kRequestTimeOut: TimeInterval = 60
let kMessageRequestServerFaild = "Có lỗi xảy ra, vui lòng thử lại sau!"

struct NetworkManager {
    static let manager: Session = {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = kRequestTimeOut
            config.timeoutIntervalForResource = kRequestTimeOut
            config.httpAdditionalHeaders = Session.defaultHTTPHeaders
            config.httpMaximumConnectionsPerHost = 10
            return config
        }()
        let manager = Session(configuration: configuration, serverTrustPolicyManager: nil)
        return manager
    }()
}

final class BaseRequest: NSObject {
    
}
