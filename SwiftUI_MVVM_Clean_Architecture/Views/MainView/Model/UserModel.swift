//
//  UserModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation

struct ListUserModel: Codable {
    var total: Int?
    var page: Int?
    var limit: Int?
    var offset: Int?
    var data: [UserModel]?
    
    enum CodingsKey: String, CodingKey {
        case total = "total"
        case page = "page"
        case limit = "limit"
        case offset = "offset"
        case data = "data"
    }
}

struct UserModel: Codable, Identifiable {
    
    var id: String?
    var lastName: String?
    var firstName: String?
    var email: String?
    var title: String?
    var picture: String?
    
    enum CodingsKey: String, CodingKey {
        case id = "id"
        case lastName = "lastName"
        case firstName = "firstName"
        case email = "email"
        case title = "title"
        case picture = "picture"
    }
}
