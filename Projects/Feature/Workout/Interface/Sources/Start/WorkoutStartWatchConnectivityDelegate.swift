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
    public let viewStore: ViewStoreOf<WorkoutStartStore>
    
    init(viewStore: ViewStoreOf<WorkoutStartStore>) {
        self.viewStore = viewStore
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
