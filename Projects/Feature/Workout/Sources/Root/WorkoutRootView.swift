//
//  WorkoutRootView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

extension WorkoutRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    Text("운동을 시작해보세요")
                        .padding(.top, 50)
                        .padding(.bottom, 85)
                    
                    Circle()
                        .frame(width: 327, height: 327)
                        .foregroundColor(.mint)
                    
                    Spacer()
                    
                    Button("시작하기") {
                        viewStore.send(.startButtonTapped)
                    }
                    .buttonStyle(.bordered)
                    .padding(.bottom, 34)
                }
                .navigationDestination(for: WorkoutScene.self) { scene in
                    switch scene {
                    case .workoutHome:
                        IfLetStore(self.store.scope(state: \.workoutHome, action: { .workoutHome($0) })) {
                            WorkoutHomeView(store: $0)
                        }
                        
                    case .workoutStart:
                        IfLetStore(self.store.scope(state: \.workoutStart, action: { .workoutStart($0) })) {
                            WorkoutStartView(store: $0)
                        }
                        
                    case .workoutTimer:
                        IfLetStore(self.store.scope(state: \.workoutTimer, action: { .workoutTimer($0) })) {
                            WorkoutTimerView(store: $0)
                        }
                        
                    case .workoutEnd:
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
