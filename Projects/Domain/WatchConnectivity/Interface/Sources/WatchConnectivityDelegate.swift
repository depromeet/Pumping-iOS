//
//  WorkoutStartWatchConnectivityDelegate.swift
//  FeatureWorkout
//
//  Created by 송영모 on 2023/06/26.
//

import WatchConnectivity

import ComposableArchitecture

import DomainWorkoutInterface

public class WatchConnectivityDelegate: NSObject, ObservableObject ,WCSessionDelegate {
    public weak var session: WCSession?
    
    @Published public var heartRate: Double = 0.0
    @Published public var calorie: Double = 0.0
    
    public init(session: WCSession = .default) {
        self.session = session
        
        super.init()
        
        self.session?.delegate = self
        self.session?.activate()
    }
    
    public func sendMessage(key: String, value: Any) {
        DispatchQueue.main.async {
            self.session?.sendMessage([key: value], replyHandler: nil)
            debugPrint("iOS send key: \(key) value: \(value)")
        }
    }
    
    public func sendPumpingTimerData(from timers: [PumpingTimer], isHardPush: Bool = false) {
        DispatchQueue.main.async {
            do {
                let pumpingTimerData = PumpingTimerData(
                    timers: timers,
                    updatedTime: Date().timeIntervalSince1970,
                    isHardPush: true)
                let data = try JSONEncoder().encode(pumpingTimerData)
                self.session?.sendMessageData(data, replyHandler: nil)
                debugPrint("iOS send data: \(data)")
            } catch {
                print(error)
            }
        }
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    public func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        DispatchQueue.main.async {
            debugPrint("iOS recieved \(messageData)")
        }
    }
    
    public func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            for m in message {
                if m.key == "heartRate" {
                    guard let heartRate = m.value as? Double else { break }
                    self.heartRate = heartRate
                } else if m.key == "calorie" {
                    guard let calorie = m.value as? Double else { break }
                    self.calorie = calorie
                }
            }
        }
    }
}
