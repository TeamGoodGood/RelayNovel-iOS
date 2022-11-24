//
//  BGM.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/22.
//

import Foundation

class BGM: Category {
    let hashTag: String
    let fileName: String
    
    init(id: Int, name: String, hashTag: String, fileName: String) {
        self.hashTag = hashTag
        self.fileName = fileName
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
    let bgm8: BGM
    
    let list: [BGM]
    
    init() {
        bgm1 = BGM(id: 0, name: "미스테리 플레이리스트 제목", hashTag: "#미스테리 #범죄 #음산한", fileName: "Playlist_01")
        bgm2 = BGM(id: 1, name: "공포 플레이리스트 제목", hashTag: "#공포 #호러 #음산한 #피아노", fileName: "Playlist_02")
        bgm3 = BGM(id: 2, name: "스리럴 플레이리스트 제목", hashTag: "#미스테리 #스릴러", fileName: "Playlist_03")
        bgm4 = BGM(id: 3, name: "모험 플레이리스트 제목", hashTag: "#판타지 #모험 #대항해시대 #해적 #극적인", fileName: "Playlist_04")
        bgm5 = BGM(id: 4, name: "사랑 사극 플레이리스트 제목", hashTag: "#사극 #동양풍 #해금 #극적인 #슬픈", fileName: "Playlist_05")
        bgm6 = BGM(id: 5, name: "슬픈 사극 플레이리스트 제목", hashTag: "#사극  #동양풍  #해금  #아련한", fileName: "Playlist_06")
        bgm7 = BGM(id: 6, name: "로맨스 플레이리스트 제목", hashTag: "#로맨스  #슬픈  #상실감  #어제의_너,,", fileName: "Playlist_07")
        bgm8 = BGM(id: 7, name: "아포칼립스 플레이리스트 제목", hashTag: "#아포칼립스 #좀비 #세계멸망 #바이러스", fileName: "Playlist_08")
        
        list = [bgm1, bgm2, bgm3, bgm4, bgm5, bgm6, bgm7, bgm8]
    }
    
    func getBGMName(id: Int) -> String {
        var bgmName = "플레이리스트 제목 오류"
        
        for i in 0..<list.count {
            if list[i].id == id {
                bgmName = list[i].name
            }
        }

        return bgmName
    }
    
    func getBGMHashTag(id: Int) -> String {
        var bgmHashTag = "플레이리스트 해시태그 오류"
        
        for i in 0..<list.count {
            if list[i].id == id {
                bgmHashTag = list[i].hashTag
            }
        }

        return bgmHashTag
    }
}
