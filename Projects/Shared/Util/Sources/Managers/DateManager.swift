//
//  DateManager.swift
//  SharedUtilInterface
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public class DateManager {
    public static func toClockString(from second: Int) -> String {
        let h = String(format: "%02d", second / 3600)
        let m = String(format: "%02d", (second % 3600) / 60)
        let s = String(format: "%02d", (second % 3600) % 60)
        
        return "\(h):\(m):\(s)"
    }
}
