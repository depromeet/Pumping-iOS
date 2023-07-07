//
//  String.swift
//  SharedUtil
//
//  Created by 박현우 on 2023/06/29.
//

import Foundation

public extension String {
    func toDateWithCustomFormat(_ format: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.date(from: self) ?? .init()
    }
}
