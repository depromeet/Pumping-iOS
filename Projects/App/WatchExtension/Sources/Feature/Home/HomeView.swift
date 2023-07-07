//
//  HomeView.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import SwiftUI
import UIKit

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
                TabView {
                    endView()

                    timerListView()
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
                viewStore.send(.sinkPumpingTimerData(pumpingTimerData))
            }
            .ignoresSafeArea()
        }
    }
    
    //TODO: 모든 운동 종료 기능 추가
    private func endView() -> some View {
        VStack {
            Button("종료") {
                
            }
        }
    }
    
    private func timerListView() -> some View {
        ForEachStore(self.store.scope(state: \.timerCells, action: HomeStore.Action.timerCell(id:action:))) {
            TimerCellView(store: $0)
        }
    }
}
