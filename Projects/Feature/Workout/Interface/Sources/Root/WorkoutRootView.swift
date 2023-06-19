//
//  WorkoutRootView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutRootView: View {
    public let store: StoreOf<WorkoutRootStore>
    
    public init(store: StoreOf<WorkoutRootStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    HStack {
                        Spacer()
                        
                        Text("운동을 시작해보세요")
                            .font(.pretendard(size: 24, type: .bold))
                            .padding(.top, 50)
                            .padding(.bottom, 85)
                        
                        Spacer()
                    }
                    
                    Circle()
                        .frame(width: 327, height: 327)
                        .foregroundColor(.colorCyan300)
                    
                    Spacer()
                    
                    Button(action: {
                        viewStore.send(.startButtonTapped)
                    }, label: {
                        Text("시작하기")
                            .font(.pretendard(size: 18, type: .bold))
                            .foregroundColor(.colorGrey000)
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                    })
                    .background(Color.colorCyan300)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 34)
                }
                .background(Color.colorGrey000)
                .navigationDestination(for: WorkoutScene.self) { scene in
                    switch scene {
                    case .home:
                        IfLetStore(self.store.scope(state: \.workoutHome, action: { .workoutHome($0) })) {
                            WorkoutHomeView(store: $0)
                        }
                        
                    case .start:
                        IfLetStore(self.store.scope(state: \.workoutStart, action: { .workoutStart($0) })) {
                            WorkoutStartView(store: $0)
                        }
                        
                    case .timer:
                        IfLetStore(self.store.scope(state: \.workoutTimer, action: { .workoutTimer($0) })) {
                            WorkoutTimerView(store: $0)
                        }
                        
                    case .end:
                        IfLetStore(self.store.scope(state: \.workoutEnd, action: { .workoutEnd($0) })) {
                            WorkoutEndView(store: $0)
                        }
                        
                    case .record:
                        IfLetStore(self.store.scope(state: \.workoutRecord, action: { .workoutRecord($0) })) {
                            WorkoutRecordView(store: $0)
                        }
                        
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}
