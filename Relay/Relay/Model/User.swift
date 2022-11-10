//
//  User.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation

struct User: Codable {
    var id: Int?
    var email: String?
    var username: String?
    var penname: String
}

struct UserResponse: Codable {
    var id: Int?
    var penname: String
}
