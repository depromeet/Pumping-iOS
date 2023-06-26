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
    public weak var viewStore: ViewStoreOf<HomeStore>?
    public weak var session: WCSession?
    
    init(viewStore: ViewStoreOf<HomeStore>, session: WCSession = .default) {
        self.viewStore = viewStore
        self.session = session
        
        super.init()
        
        self.session?.delegate = self
        self.session?.activate()
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint("watch recieved \(message)")
    }
}
