//
//  APIConstants.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation

class APIConstants: NSObject {

    static let TEST_ON_LOCAL = true
    static let BASE_URL = TEST_ON_LOCAL ? "http://localhost:8000/api/v1" : "http://ec2-3-39-59-205.ap-northeast-2.compute.amazonaws.com:8000/api/v1"
}
