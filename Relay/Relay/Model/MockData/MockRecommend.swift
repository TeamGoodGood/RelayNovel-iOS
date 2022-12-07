//
//  MockRecommend.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import Foundation

struct MockRecommend {
    var recommend: Recommend
    
    init() {
        recommend = Recommend(
            story1: mockStory.story1,
            story2: mockStory.story2,
            story3: mockStory.story3
        )
    }
}

var mockRecommend = MockRecommend()
