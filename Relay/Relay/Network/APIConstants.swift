//
//  APIConstants.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation

class APIConstants: NSObject {

    static let TEST_ON_LOCAL = false
    static let BASE_URL = TEST_ON_LOCAL ? "http://localhost:8000/api/v1" : "https://goodgoodrelay.shop/api/v1"
}
