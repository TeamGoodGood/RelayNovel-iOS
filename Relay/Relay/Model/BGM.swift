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
//        bgm1 = BGM(id: 0, name: "미스테리 플레이리스트 제목", hashTag: "#미스테리 #범죄 #음산한", fileName: "PlayList_1")
//        bgm2 = BGM(id: 1, name: "공포 플레이리스트 제목", hashTag: "#공포 #호러 #음산한 #피아노", fileName: "PlayList_2")
//        bgm3 = BGM(id: 2, name: "스리럴 플레이리스트 제목", hashTag: "#미스테리 #스릴러", fileName: "PlayList_3")
//        bgm4 = BGM(id: 3, name: "모험 플레이리스트 제목", hashTag: "#판타지 #모험 #대항해시대 #해적 #극적인", fileName: "PlayList_4")
//        bgm5 = BGM(id: 4, name: "사랑 사극 플레이리스트 제목", hashTag: "#사극 #동양풍 #해금 #극적인 #슬픈", fileName: "PlayList_5")
//        bgm6 = BGM(id: 5, name: "슬픈 사극 플레이리스트 제목", hashTag: "#사극  #동양풍  #해금  #아련한", fileName: "PlayList_6")
//        bgm7 = BGM(id: 6, name: "로맨스 플레이리스트 제목", hashTag: "#로맨스  #슬픈  #상실감  #어제의_너,,", fileName: "PlayList_7")
//        bgm8 = BGM(id: 7, name: "아포칼립스 플레이리스트 제목", hashTag: "#아포칼립스 #좀비 #세계멸망 #바이러스", fileName: "PlayList_8")
        
        bgm1 = BGM(id: 0, name: "좀비 아포칼립스", hashTag: "#긴장되는", fileName: "PlayList_1")
        bgm2 = BGM(id: 1, name: "이루어 질 수 없습니다", hashTag: "#애절한", fileName: "PlayList_2")
        bgm3 = BGM(id: 2, name: "모험의 시작", hashTag: "#극적인", fileName: "PlayList_3")
        bgm4 = BGM(id: 3, name: "안개 낀 숲", hashTag: "#고조되는", fileName: "PlayList_4")
        bgm5 = BGM(id: 4, name: "다녀오겠습니다 어머니", hashTag: "#그리운", fileName: "PlayList_5")
        bgm6 = BGM(id: 5, name: "범죄 준비", hashTag: "#미스테리한", fileName: "PlayList_6")
        bgm7 = BGM(id: 6, name: "어제의 너", hashTag: "#아련한", fileName: "PlayList_7")
        bgm8 = BGM(id: 7, name: "한 맺힌 저주", hashTag: "#으스스한", fileName: "PlayList_8")
        
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
    
    func getBGMFileName(id: Int) -> String {
        var bgmFileName = "플레이리스트 파일이름 오류"
        
        for i in 0..<list.count {
            if list[i].id == id {
                bgmFileName = list[i].fileName
            }
        }
        return bgmFileName
    }
}
