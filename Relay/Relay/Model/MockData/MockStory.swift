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
    
    init() {
        story1 = Story(
            id: 0,
            original: mockUserResponse.curryResponse,
            genre: "로맨스",
            header: "이창형을 참고해주세요.",
            title: "26/남/이창형",
            content: "26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.26남 이창형이였다. 그것은 바로 26 남 이창형인 것이다. 그렇기 때문에 26 남 이창형인 것이고 26살의 남자인 것이다. 그는 울산의 이창형이다. 그렇다.",
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
            header: "이창형이라는 주인공이 변태성향을 가지고 있지만 몸이 매우 건장한 사람입니다. 그런느낌을 가지고 작성해주세요.",
            title: "문을 막는 남자, 이창형",
            content: "이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...이창형이 들어오자 마자 문을 닫았다. 그리고 꼼짝을 하지 않았다. 나는 무서웠다. 그는 왜 문을 굳게 잠그고 움직이지 않을까. 그리고 왜 나를 노려볼까...",
            bgm: 1,
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
            content: "Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.Yo 이재웅, 넌 정말 멋져. 정말 잘생겼어. 랩도 잘 하고, 이건 바로 인생의 진리지.",
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
            original: mockUserResponse.eveResponse,
            genre: "판타지",
            header: "서울행 ktx가 매우 비싼걸 알아주세요",
            title: "KTX를 못타게 된 어느날",
            content: "월요일 오전, 서울에서 다시 포항으로 돌아가기 위해 동료들과 KTX를 예약했던 나. 정상적으로 예매했다고 생각했지만 어떤 악당들에게 속임수를 당해 KTX 환불을 못하게 되는데... 결국!! 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵 이러쿵 저러쿵.",
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
            original: mockUserResponse.eveResponse,
            genre: "SF",
            header: "내년 2월에 개봉할 앤트맨 퀀텀매니아 많이 사랑해주세요",
            title: "가디언즈 오브 포스텍",
            content: "감자국의 수도 원주에서 온 어떤 남자와 경상도가 세상의 중심이라 믿는 남자. 그리고 브라질에서 왔지만 브라질 사람은 아니고 그렇지만 한국말을 잘해 한국사람이긴 하지만 한국에서 살지 않고 브라질로 돌아갈 예정인 코브라질리안인 여자에 '서울에서 할까?'를 얘기하면 어떤 상황에서든 미소를 짓는 4인까지... 나 이곳에서 지내도 괜찮은걸까? 포스텍에서의 모험이 시작된다!",
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
