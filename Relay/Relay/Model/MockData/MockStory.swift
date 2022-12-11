//
//  MockStory.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/21.
//

import Foundation

struct MockStory {
    var story1: Story
    var story2: Story
    var story3: Story
    var story4: Story
    var story5: Story
    var story6: Story
    var story7: Story
    var story8: Story
    var story9: Story
    var story10: Story
    
    var allList: [Story]
    
    func fetchRunningStories() -> [Story] {
        let stories = allList
        var runningStories: [Story] = []
        
        for story in stories {
            if !story.finished {
                runningStories.append(story)
            }
        }
        
        return runningStories
    }
    
    func fetchFinishStories() -> [Story] {
        let stories = allList
        var finishStories: [Story] = []
        
        for story in stories {
            if story.finished {
                finishStories.append(story)
            }
        }
        
        return finishStories
    }
    
    func fetchNewerStories() -> [Story] {
        var newerStories: [Story] = []
        
        newerStories = allList.sorted {
            $0.created_time > $1.created_time
        }
        
        return newerStories
    }
    
    func fetchOlderStories() -> [Story] {
        var olderStories: [Story] = []
        
        olderStories = allList.sorted {
            $0.created_time < $1.created_time
        }
        
        return olderStories
    }
    
    func fetchMostLikeStories() -> [Story] {
        var mostLikeStories: [Story] = []
        
        mostLikeStories = allList.sorted {
            $0.like_count > $1.like_count
        }
        
        return mostLikeStories
    }
    
    func fetchRomanceStories() -> [Story] {
        var stories: [Story] = []
        
        for story in allList {
            if story.genre == "로맨스" {
                stories.append(story)
            }
        }
        
        return stories
    }
    
    func fetchThrillerStories() -> [Story] {
        var stories: [Story] = []
        
        for story in allList {
            if story.genre == "스릴러/공포" {
                stories.append(story)
            }
        }
        
        return stories
    }
    
    func fetchFantasyStories() -> [Story] {
        var stories: [Story] = []
        
        for story in allList {
            if story.genre == "판타지" {
                stories.append(story)
            }
        }
        
        return stories
    }
    
    func fetchSFStories() -> [Story] {
        var stories: [Story] = []
        
        for story in allList {
            if story.genre == "SF" {
                stories.append(story)
            }
        }
        
        return stories
    }
    
    func fetchInferenceStories() -> [Story] {
        var stories: [Story] = []
        
        for story in allList {
            if story.genre == "추리" {
                stories.append(story)
            }
        }
        
        return stories
    }
    
    init() {
        story1 = Story(
            id: 0,
            original: mockUserResponse.curryResponse,
            genre: "로맨스",
            header: "이창형을 참고해주세요.",
            title: "26/남/이창형",
            content: """
나는 대한민국에 거주하고 있는 26살 남자 이창형. 개발 공부를 하고 있으며 프로그래머를 꿈꾸는 사람이다.

평소에는 운동과 게임을 즐겨한다.
""",
            bgm: 0,
            like_count: 2,
            step_limit: 20,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211212100,
            user_liked: true
        )
        
        story2 = Story(
            id: 1,
            original: mockUserResponse.curryResponse,
            genre: "스릴러/공포",
            header: "재밌게 써주세요 !!",
            title: "나 홀로 우주",
            content: """
차갑고 어두운 아무것도 보이지 않는 이 공간에 눈을 떴다. 주변에 사람들은 다 쓰러져있고, 나 홀로 우주선에서 우주를 방황중이다
""",
            bgm: 3,
            like_count: 10,
            step_limit: 10,
            current_step: 10,
            finished: true,
            contributed_users: [mockUserResponse.curryResponse],
            created_time: 202211212200,
            user_liked: true
        )
        
        story3 = Story(
            id: 2,
            original: mockUserResponse.changBroResponse,
            genre: "로맨스",
            header: "이재웅 로맨스입니다.",
            title: "27/남/이재웅",
            content: """
여느때와 같은 날이였다. 무기력하게 잠에서 깨서 물을 마시러 하고 있었다.

보통때와 다르게 많이 흐린 날씨였지만 그뿐이였다. 잠을 깨울 물 한 잔을 뜨고 백수생활에 걸맞게 바로 티비 앞을 향해 앉았다. 그런데…

“국가재난상황입니다. 국민 여러분께서는 자택을 나서지 마시고 군/경의 구조가 있을때까지 대기해주시길 바랍니다.”

티비를 트니 모든 채널에서 재난방송이 나오고 있었다. 재난이라고…? 왜 밖을 나가지 말라는걸까?

전쟁이 난것도 아니고 밖을 나서지 말라는 말만 하니 무슨일이 있는건지 궁금해졌다.
""",
            bgm: 2,
            like_count: 5,
            step_limit: 30,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211212300,
            user_liked: false
        )
        
        story4 = Story(
            id: 3,
            original: mockUserResponse.changBroResponse,
            genre: "판타지",
            header: "판타지아",
            title: "나 이창형, 때리다.",
            content: "26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.",
            bgm: 3,
            like_count: 12,
            step_limit: 10,
            current_step: 10,
            finished: true,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211220000,
            user_liked: true
        )
        
        story5 = Story(
            id: 4,
            original: mockUserResponse.curryResponse,
            genre: "스릴러/공포",
            header: "이창형이라는 주인공이 변태성향을 가지고 있지만 몸이 매우 건장한 사람입니다. 그런느낌을 가지고 작성해주세요.",
            title: "문을 막는 남자, 이창형",
            content: "이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...",
            bgm: 4,
            like_count: 2,
            step_limit: 20,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211220100,
            user_liked: true
        )
        
        story6 = Story(
            id: 5,
            original: mockUserResponse.changBroResponse,
            genre: "판타지",
            header: "판타지아",
            title: "나 이창형, 때리다.",
            content: "26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.",
            bgm: 5,
            like_count: 5,
            step_limit: 10,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211220200,
            user_liked: true
        )
        
        story7 = Story(
            id: 6,
            original: mockUserResponse.eveResponse,
            genre: "추리",
            header: "메추리알 있으면 먹긴하는데 생각날정도는 아님",
            title: "추리인 장르를 볼때는 메추리알",
            content: "추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다. 추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다. 추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다. 추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다. 추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다. 추리를 보니 메추리알이 생각났고 메추리알이 생각나니 마추픽추가 떠올랐다. 그랬던 것이다.",
            bgm: 6,
            like_count: 0,
            step_limit: 20,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211220300,
            user_liked: false
        )
        
        story8 = Story(
            id: 7,
            original: mockUserResponse.curryResponse,
            genre: "무협",
            header: "무협을 즐기는 사람만 작성해주세요",
            title: "무협의 신, 이무협",
            content: "내 이름은 이무협. 무협을 좋아하기에 이름이 무협이다. 어쩌라고. 이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...이러쿵 저러쿵...",
            bgm: 5,
            like_count: 2,
            step_limit: 20,
            current_step: 1,
            finished: false,
            created_time: 202211220400,
            user_liked: false
        )
        
        story9 = Story(
            id: 8,
            original: mockUserResponse.curryResponse,
            genre: "시대극",
            header: "이 시대는 가상시대입니다",
            title: "시대를 잘못 타고나버렸다.",
            content: "2050년 최첨단 세상에서 태어나 먹고자고만 하면서 문명을 누렸어야 하는데 아주 잘못 태어나버렸다. 누워있지만 눕고싶고 쉬고있지만 더 쉬고싶어. 열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~열심히할게요~~",
            bgm: 2,
            like_count: 2,
            step_limit: 20,
            current_step: 4,
            finished: false,
            contributed_users: [mockUserResponse.curryResponse, mockUserResponse.changBroResponse, mockUserResponse.eveResponse],
            created_time: 202211220500,
            user_liked: true
        )
        
        story10 = Story(
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
        
        allList = [story1, story2, story3, story4, story5, story6, story7, story8, story9, story10]
    }
}

var mockStory = MockStory()

