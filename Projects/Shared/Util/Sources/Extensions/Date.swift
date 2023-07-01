//
//  Date.swift
//  SharedUtil
//
//  Created by 박현우 on 2023/06/29.
//

import Foundation

public extension Date {
    func toStringWithCustomFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: self)
    }
}
