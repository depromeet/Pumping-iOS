//
//  WorkoutRootView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import Shared
import Domain

public struct WorkoutRootView: View {
    public let store: StoreOf<WorkoutRootStore>
    
    @StateObject private var watchConnectivityDelegate: WatchConnectivityDelegate = .init()
    
    public init(store: StoreOf<WorkoutRootStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                WorkoutHomeView(store: self.store.scope(state: \.workoutHome, action: { .workoutHome($0) }))
                    .background(PumpingColors.colorGrey100.swiftUIColor)
                    .navigationDestination(for: WorkoutScene.self) { scene in
                        switch scene {
                        case .start:
                            IfLetStore(self.store.scope(state: \.workoutStart, action: { .workoutStart($0) })) {
                                WorkoutStartView(store: $0)
                            }
                            
                        case .timer:
                            IfLetStore(self.store.scope(state: \.workoutTimer, action: { .workoutTimer($0) })) {
                                WorkoutTimerView(store: $0)
                                    .environmentObject(watchConnectivityDelegate)
                            }
                            
                        case .end:
                            IfLetStore(self.store.scope(state: \.workoutEnd, action: { .workoutEnd($0) })) {
                                WorkoutEndView(store: $0)
                            }
                            
                        default:
                            EmptyView()
                        }
                    }
            }
        }
    }
}
