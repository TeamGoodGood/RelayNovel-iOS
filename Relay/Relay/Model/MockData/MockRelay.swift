//
//  MockRelay.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import Foundation

struct MockRelay {
    var story1Relay: [Relay]
    var story2Relay: [Relay]
    var story3Relay: [Relay]
    var story4Relay: [Relay]
    var story5Relay: [Relay]
    var story6Relay: [Relay]
    var story7Relay: [Relay]
    var story8Relay: [Relay]
    var story9Relay: [Relay]
    var story10Relay: [Relay]
    
    init() {
        story1Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211212105
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211212110
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211212115
        ),    Relay(
            contributer: mockUser.curry,
            content: "스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211212120
        )
        ]
        
        story2Relay = [
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212205
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212210
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212215
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212220
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212225
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212230
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212235
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212245
            ),
            Relay(
                contributer: mockUser.curry,
                content: "자기가 직접 하기",
                created_time: 202211212250
            )
        ]
        
        story3Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211212305
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211212310
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211212315
        )
        ]
        
        story4Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
            created_time: 202211220005
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
            created_time: 202211220010
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
            created_time: 202211220015
        )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220020
            )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220025
            )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220030
            )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220035
            )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220040
            )
            ,
                Relay(
                    contributer: mockUser.eve,
                content: "스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444스토리444",
                created_time: 202211220045
            )
        ]
        
        story5Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211220105
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211220110
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211220115
        )
        ]
        
        story6Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211220205
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211220210
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211220215
        )
        ]
        
        story7Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211220305
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211220310
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211220315
        )
        ]
        
        story8Relay = []
        
        story9Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211220505
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211220510
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211220515
        )
        ]
        
        story10Relay = [
            Relay(
                contributer: mockUser.curry,
            content: "스토리333 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.스토리1 릴레이 커리.",
            created_time: 202211220605
        ),
            Relay(
                contributer: mockUser.changBro,
            content: "스토리333 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.스토리1 릴레이 창브로.",
            created_time: 202211220610
        ),
            Relay(
                contributer: mockUser.eve,
            content: "스토리333 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.스토리1 릴레이 이브.",
            created_time: 202211220615
        )
        ]
    }
}

var mockRelay = MockRelay()
