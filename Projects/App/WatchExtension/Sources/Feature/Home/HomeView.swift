//
//  HomeView.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import SwiftUI

import ComposableArchitecture

public struct HomeView: View {
    public let store: StoreOf<HomeStore>
    
    @EnvironmentObject private var workoutDelegate: WorkoutDelegate
    @EnvironmentObject private var watchConnectivityDelegate: WatchConnectivityDelegate
    
    public init(store: StoreOf<HomeStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: .zero) {
                Text("heartrate: \(viewStore.heartRate)")
                
                Text("calorie: \(viewStore.calorie)")
                
                Button("start") {
                    
                }
            }
            .onAppear {
                workoutDelegate.requestAuthorization { (success, errorOrNil) in
                    workoutDelegate.startWorkout(workoutType: .functionalStrengthTraining)
                }
            }
            .onReceive(workoutDelegate.$heartRate, perform: { heartRate in
                viewStore.send(.setHeartRate(Int(heartRate)))
                watchConnectivityDelegate.sendMessage(key: "heartRate", value: heartRate)
            })
            .onReceive(workoutDelegate.$calorie, perform: { calorie in
                viewStore.send(.setCalorie(Int(calorie)))
                watchConnectivityDelegate.sendMessage(key: "calorie", value: calorie)
            })
            .onReceive(watchConnectivityDelegate.$pumpingTimerData) { pumpingTimerData in
                
            }
            .ignoresSafeArea()
        }
    }
}
