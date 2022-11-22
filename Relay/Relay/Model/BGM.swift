//
//  BGM.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/22.
//

import Foundation

class BGM: Category { }

struct Playlist {
    let list1: BGM
    let list2: BGM
    let list3: BGM
    let list4: BGM
    let list5: BGM
    let list6: BGM
    let list7: BGM
    
    init() {
        list1 = BGM(id: 0, name: "#미스테리 #범죄 #음산한")
        list2 = BGM(id: 1, name: "#공포 #호러 #음산한 #피아노")
        list3 = BGM(id: 2, name: "#미스테리 #스릴러")
        list4 = BGM(id: 3, name: "#판타지 #모험 #대항해시대 #해적 #극적인")
        list5 = BGM(id: 4, name: "#사극 #동양풍 #해금  #극적인  #슬픈  #내가_바란 것은_다정한 말_한마디 였소,,")
        list6 = BGM(id: 5, name: "#사극  #동양풍  #해금  #아련한  #소자_다녀오겠습니다_어무이…")
        list7 = BGM(id: 6, name: "#로맨스  #슬픈  #상실감  #어제의_너,,")
    }
}
