//
//  WorkoutStartWatchConnectivityDelegate.swift
//  FeatureWorkout
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation
import WatchConnectivity

import ComposableArchitecture

public class WorkoutStartWatchConnectivityDelegate: NSObject, WCSessionDelegate {
    public weak var viewStore: ViewStoreOf<WorkoutStartStore>?
    public weak var session: WCSession?
    
    init(viewStore: ViewStoreOf<WorkoutStartStore>, session: WCSession = .default) {
        self.viewStore = viewStore
        self.session = session
        
        super.init()
        
        self.session?.delegate = self
        self.session?.activate()
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        debugPrint("iOS recieved \(message)")
    }
}
