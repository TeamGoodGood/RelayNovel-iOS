//
//  Story.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation

struct Story: Codable {
    var id: Int
    var original: UserResponse
    var genre: String
    var title: String
    var content: String
    var bgm: Int
    var like_count: Int
    var step_limit: Int
    var current_step: Int
    var finished: Bool
    var contributed_users: [UserResponse]?
    var created_time: Double
    var user_liked: Bool
}
