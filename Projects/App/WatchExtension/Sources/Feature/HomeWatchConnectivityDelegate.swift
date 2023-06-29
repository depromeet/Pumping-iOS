//
//  WatchConnectivityDelegate.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation
import WatchConnectivity

import ComposableArchitecture

public class HomeWatchConnectivityDelegate: NSObject, WCSessionDelegate {
    public weak var session: WCSession?
    
    init(session: WCSession = .default) {
        self.session = session
        
        super.init()
        
        self.session?.delegate = self
        self.session?.activate()
    }
    
    public func sendMessage(key: String, value: Double) {
        self.session?.sendMessage([key: value], replyHandler: nil)
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint("watchOS recieved \(message)")
    }
}
