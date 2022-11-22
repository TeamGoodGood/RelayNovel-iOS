//
//  Extension+Double.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/23.
//

import Foundation

extension Double {
    //TODO: date 시간출력 확인 후 로직수정 필요
    var doubleDateToString: String {
        let intDate = Int(self)
        
        let year = intDate / 100000000
        let month = (intDate % 100000000) / 1000000
        let day = (intDate % 1000000) / 10000
        
        return "\(year). \(month). \(day)"
    }
}
