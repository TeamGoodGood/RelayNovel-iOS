//
//  BGM.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/22.
//

import Foundation

class BGM: Category {
    let hashTag: String
    
    init(id: Int, name: String, hashTag: String) {
        self.hashTag = hashTag
        super.init(id: id, name: name)
    }
}

struct Playlist {
    let bgm1: BGM
    let bgm2: BGM
    let bgm3: BGM
    let bgm4: BGM
    let bgm5: BGM
    let bgm6: BGM
    let bgm7: BGM
    
    let list: [BGM]
    
    init() {
        bgm1 = BGM(id: 0, name: "미스테리 플레이리스트 제목", hashTag: "#미스테리 #범죄 #음산한")
        bgm2 = BGM(id: 1, name: "공포 플레이리스트 제목", hashTag: "#공포 #호러 #음산한 #피아노")
        bgm3 = BGM(id: 2, name: "스리럴 플레이리스트 제목", hashTag: "#미스테리 #스릴러")
        bgm4 = BGM(id: 3, name: "모험 플레이리스트 제목", hashTag: "#판타지 #모험 #대항해시대 #해적 #극적인")
        bgm5 = BGM(id: 4, name: "사랑 사극 플레이리스트 제목", hashTag: "#사극 #동양풍 #해금 #극적인 #슬픈")
        bgm6 = BGM(id: 5, name: "슬픈 사극 플레이리스트 제목", hashTag: "#사극  #동양풍  #해금  #아련한")
        bgm7 = BGM(id: 6, name: "로맨스 플레이리스트 제목", hashTag: "#로맨스  #슬픈  #상실감  #어제의_너,,")
        
        list = [bgm1, bgm2, bgm3, bgm4, bgm5, bgm6, bgm7]
    }
    

}
