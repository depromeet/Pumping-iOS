//
//  WatchConnectivityDelegate.swift
//  FeatureWorkout
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation
import WatchConnectivity

import ComposableArchitecture

class WatchConnectivityDelegate: NSObject, WCSessionDelegate {
    public let viewStore: ViewStoreOf<WorkoutHomeStore>
    
    init(viewStore: ViewStoreOf<WorkoutHomeStore>) {
        self.viewStore = viewStore
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
