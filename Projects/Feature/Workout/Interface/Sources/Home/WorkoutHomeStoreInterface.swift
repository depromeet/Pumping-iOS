//
//  WorkoutHome.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import Foundation

import ComposableArchitecture
import SharedDesignSystem

public struct WorkoutHomeStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public var workoutMenuList: [IdentifiedArrayOf<PumpingTextCellStore.State>] = [
            [.init(id: .init(), title: "유산소")],
            [.init(id: .init(), title: "어깨"), .init(id: .init(), title: "가슴"), .init(id: .init(), title: "팔"), .init(id: .init(), title: "등")],
            [.init(id: .init(), title: "엉덩이"), .init(id: .init(), title: "다리")]
        ]
        
        public var startButtonisEnabled: Bool = true
        
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case startButtonTapped
        case pumpingTextCell(id: PumpingTextCellStore.State.ID, action: PumpingTextCellStore.Action)
        case goToWorkoutStart
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}
