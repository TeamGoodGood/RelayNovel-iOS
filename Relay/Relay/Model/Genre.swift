//
//  Genre.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/22.
//

import Foundation

class Genre: Category { }

struct GenreList {
    let all: Genre
    let romance: Genre
    let thriller: Genre
    let fantasy: Genre
    let sf: Genre
    let inference: Genre
    let martialArts: Genre
    let historical: Genre
    let general: Genre
    let etc: Genre
    
    init() {
        all = Genre(id: 0, name: "전체")
        romance = Genre(id: 1, name: "로맨스")
        thriller = Genre(id: 2, name: "스릴러/공포")
        fantasy = Genre(id: 3, name: "판타지")
        sf = Genre(id: 4, name: "SF")
        inference = Genre(id: 5, name: "추리")
        martialArts = Genre(id: 6, name: "무협")
        historical = Genre(id: 7, name: "시대극")
        general = Genre(id: 8, name: "일반")
        etc = Genre(id: 9, name: "기타")
    }
}
