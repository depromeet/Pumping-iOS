//
//  WatchConnectivityDelegate.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation
import WatchConnectivity

import ComposableArchitecture

public class WatchConnectivityDelegate: NSObject, ObservableObject, WCSessionDelegate {
    public weak var session: WCSession?
    
    init(session: WCSession = .default) {
        self.session = session
        
        super.init()
        
        self.session?.delegate = self
        self.session?.activate()
    }
    
    public func sendMessage(key: String, value: Double) {
        DispatchQueue.main.async {
            self.session?.sendMessage([key: value], replyHandler: nil)
            debugPrint("watchOS send key: \(key) value: \(value)")
        }
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            debugPrint("watchOS recieved \(message)")
        }
    }
    
    public func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            do {
                let timers = try JSONDecoder().decode([PumpingTimer].self, from: messageData)
                debugPrint("watchOS recieved \(timers)")
            } catch {
                debugPrint(error)
            }
        }
    }
}
