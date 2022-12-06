//
//  Extension+Double.swift
//  Relay
//
//  Created by 이재웅 on 2022/11/23.
//

import Foundation

extension Double {
    
    var doubleDateToString: String {
        let intDate = Int(self)
        
        let year = intDate / 100000000
        let month = (intDate % 100000000) / 1000000
        let day = (intDate % 1000000) / 10000
        
        return "\(year). \(month). \(day)"
    }
    
    var dateDifferenceToString: String {
        let intDate = Int(self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMddHHmm"
        let nowDateFormat = Int(dateFormatter.string(from: Date()))
        
        let year = intDate / 100000000
        let month = (intDate % 100000000) / 1000000
        let day = (intDate % 1000000) / 10000
        let hour = (intDate % 10000) / 100
        let minute = intDate % 100
        
        let nowYear = nowDateFormat! / 100000000
        let nowMonth = (nowDateFormat! % 100000000) / 1000000
        let nowDay = (nowDateFormat! % 1000000) / 10000
        let nowHour = (nowDateFormat! % 10000) / 100
        let nowMinute = nowDateFormat! % 100
        
        var dateDifference: String?
        
        if nowYear - year > 0 {
            
            dateDifference = "\(nowYear - year)년 전"
        } else if nowMonth - month > 0 {
            
            dateDifference = "\(nowMonth - month)달 전"
        } else if nowDay - day > 0 {
            
            dateDifference = "\(nowDay - day)일 전"
        } else if nowHour - hour > 0 {
            
            dateDifference = "\(nowHour - hour)시간 전"
        } else if nowMinute - minute > 0 {
            
            dateDifference = "\(nowMinute - minute)분 전"
        }
        
        return dateDifference ?? "오류"
    }
}
