//
//  RootStore.swift
//  Feature
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation
import ComposableArchitecture
import Shared

public struct MainTabViewStore: ReducerProtocol {
    
    public init() {}

    public struct State: Equatable {        
        public var home: CrewRootStore.State? = .init()
        public var workout: WorkoutRootStore.State? = .init()
        public var profile: ProfileRootStore.State? = .init()
        
        @BindingState public var showModal: Bool = false
        
        public init() { }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        case toggleModal
        
        case home(CrewRootStore.Action)
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
                
            case .toggleModal:
                state.showModal.toggle()
                return .none

            }
        }
        .ifLet(\.home, action: /Action.home) {
            CrewRootStore()
        }
        .ifLet(\.workout, action: /Action.workout) {
            WorkoutRootStore()
        }
        .ifLet(\.profile, action: /Action.profile) {
            ProfileRootStore()
        }

    }
}
