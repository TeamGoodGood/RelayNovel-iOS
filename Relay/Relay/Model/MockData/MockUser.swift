//
//  MockUser.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import Foundation

struct MockUser {
    var curry: User
    var changBro: User
    var eve: User
    
    init() {
        curry = User(
            id: 0,
            email: "curry@goodgood.com",
            username: "이재웅",
            penname: "커리"
        )
        changBro = User(
            id: 1,
            email: "changBro@goodgood.com",
            username: "이창형",
            penname: "창브로"
        )
        eve = User(
            id: 2,
            email: "eve@goodgood.com",
            username: "오승연",
            penname: "이브"
        )
    }
}

struct MockUserResponse {
    var curryResponse: UserResponse
    var changBroResponse: UserResponse
    var eveResponse: UserResponse
    
    init() {
        curryResponse = UserResponse(
            id: 0,
            penname: "커리"
        )
        changBroResponse = UserResponse(
            id: 1,
            penname: "창브로"
        )
        eveResponse = UserResponse(
            id: 2,
            penname: "이브"
        )
    }
}

var mockUser = MockUser()
var mockUserResponse = MockUserResponse()
var loginUser = mockUser.curry
