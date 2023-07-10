//
//  WatchConnectivityControl.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/07/11.
//

import Foundation

public enum WatchConnectivityControl: Int {
    case start
    case end
    
    static public func toDomain(int: Int) -> Self {
        switch int {
        case 0: return .start
        case 1: return .end
        default: return .start
        }
    }
}
