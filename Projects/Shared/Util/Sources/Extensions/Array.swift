//
//  Array.swift
//  SharedUtil
//
//  Created by 송영모 on 2023/06/18.
//

import Foundation

public extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
