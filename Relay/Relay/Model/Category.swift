//
//  Category.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/22.
//

import Foundation

class Category: Equatable {
    static func == (lhs: Category, rhs: Category) -> Bool {
        return (lhs.name == rhs.name) && (lhs.id == rhs.id)
    }
    
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
