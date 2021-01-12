//
//  UserModel.swift
//  SwiftUI_MVVM_Clean_Architecture
//
//  Created by Luong Quang Anh on 1/12/21.
//

import Foundation
import ObjectMapper

class UserModel: Mappable {
    
    var id: String?
    var lastName: String?
    var email: String?
    var title: String?
    var picture: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        lastName <- map["lastName"]
        email <- map["email"]
        title <- map["title"]
        picture <- map["picture"]
    }
}
