//
//  WorkoutStartWatchConnectivityDelegate.swift
//  FeatureWorkout
//
//  Created by 송영모 on 2023/06/26.
//

import Foundation
import WatchConnectivity
import ComposableArchitecture

public class WatchConnectivityDelegate: NSObject, ObservableObject ,WCSessionDelegate {
    public weak var session: WCSession?
    
    @Published public var heartRate: Double = 0.0
    @Published public var calorie: Double = 0.0
    
    init(session: WCSession = .default) {
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
        for m in message {
            if m.key == "heartRate" {
                guard let heartRate = m.value as? Double else { break }
                self.heartRate = heartRate
            } else if m.key == "calorie" {
                guard let calorie = m.value as? Double else { break }
                self.calorie = calorie
            }
        }
        debugPrint("iOS recieved \(message)")
    }
}
