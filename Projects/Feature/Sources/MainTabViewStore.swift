//
//  RootStore.swift
//  Feature
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import ComposableArchitecture
import FeatureHomeInterface
import FeatureProfileInterface
import FeatureWorkoutInterface
import FeatureHome
import FeatureProfile
import FeatureWorkout
import SharedDesignSystem

public struct MainTabViewStore: ReducerProtocol {
    
    public init() {}

    public struct State: Equatable {        
        public var home: HomeRootStore.State? = .init()
        public var workout: WorkoutRootStore.State? = .init()
        public var profile: ProfileRootStore.State? = .init()
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        
        case home(HomeRootStore.Action)
        case workout(WorkoutRootStore.Action)
        case profile(ProfileRootStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                return .none
                
            case .home:
                return .none
                
            case .workout:
                return .none
                
            case .profile:
                return .none

            }
        }
        .ifLet(\.home, action: /Action.home) {
            HomeRootStore()
        }
        .ifLet(\.workout, action: /Action.workout) {
            WorkoutRootStore()
        }
        .ifLet(\.profile, action: /Action.profile) {
            ProfileRootStore()
        }

    }
}
