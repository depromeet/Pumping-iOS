//
//  Date.swift
//  SharedUtil
//
//  Created by 박현우 on 2023/06/29.
//

import Foundation

public extension Date {
    static func toSelf(_ format: String = "yyyy-MM-ddTHH:mm:ss", value: String) -> Self {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ko_kr")
        
        return formatter.date(from: value) ?? Date()
    }
    
    static func toShortWeekdaySymbol(value: Int) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        
        return formatter.weekdaySymbols[value - 1]
    }
    
    func toShortWeekdaySymbol() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_kr")
        
        return formatter.weekdaySymbols[Calendar.current.component(.weekday, from: self) - 1]
    }
    
    func toStringWithCustomFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }
}
