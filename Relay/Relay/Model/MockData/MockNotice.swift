//
//  MockNotice.swift
//  Relay
//
//  Created by 이창형 on 2022/11/29.
//

import Foundation

struct MockNotice {
    var notice1: Notice
    var notice2: Notice
    var notice3: Notice
    var notice4: Notice
    var notice5: Notice
    var notice6: Notice
    var story = Story(
        id: 9,
        original: mockUserResponse.curryResponse,
        genre: "일반",
        header: "어쩌라고요",
        title: "일반 이반 삼반",
        content: "일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?일반 이반 삼반 사반 오반 육반 칠반 팔반 구반 십반. 나 학교다닐땐 십반까지 있었는데 요즘은 아니라며?",
        bgm: 4,
        like_count: 2,
        step_limit: 20,
        current_step: 4,
        finished: false,
        contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
        created_time: 202211220600,
        user_liked: true
    )
    
    init() {
        notice1 = Notice(
            created_time: 202211291324, noti_type: 0, related_story: story
        )
        notice2 = Notice(
            created_time: 202211221424, noti_type: 1, related_story: story
        )
        notice3 = Notice(
            created_time: 202211252224, noti_type: 2, related_story: story
        )
        notice4 = Notice(
            created_time: 202211111624, noti_type: 3, related_story: story
        )
        notice5 = Notice(
            created_time: 202211191824, noti_type: 4, related_story: story
        )
        notice6 = Notice(
            created_time: 202211092224, noti_type: 5, related_story: story
        )
    }
}

var mockNotice = MockNotice()
