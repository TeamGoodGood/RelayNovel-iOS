//
//  Notice.swift
//  Relay
//
//  Created by 이채민 on 2022/11/10.
//

import Foundation

struct Notice: Codable {
    var created_time: Double
    var noti_type: Int
    var related_story: Story
}
