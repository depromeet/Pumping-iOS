//
//  RootStore.swift
//  Feature
//
//  Created by 박현우 on 2023/06/02.
//

import Foundation

import ComposableArchitecture

import Domain
import Shared

public struct MainTabViewStore: ReducerProtocol {
    
    public init() {}

    public struct State: Equatable {
        public var currentScene: MainScene = .home
        
        public var home: CrewRootStore.State?
        public var workout: WorkoutRootStore.State? = .init()
        public var profile: ProfileRootStore.State? = .init()
        
        public var showTabBar: Bool = true
        @BindingState public var showModal: Bool = false
        
        public init(crewList: [CrewInfo]) {
            self.home = .init(crewList: crewList)
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        case selectTab(MainScene)
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
                
            case let .selectTab(scene):
                state.currentScene = scene
                return .none
                
            case .toggleModal:
                state.showModal.toggle()
                return .none
                
            case .home:
                if state.currentScene == .home {
                    state.showTabBar = state.home?.path.isEmpty ?? false
                }
                return .none
                
            case .workout:
                if state.currentScene == .workout {
                    state.showTabBar = state.workout?.path.isEmpty ?? false
                }
                return .none
                
            case .profile:
                if state.currentScene == .myPage {
                    state.showTabBar = state.profile?.path.isEmpty ?? false
                }
                return .none
            }
        }
        .ifLet(\.home, action: /Action.home) {
            CrewRootStore(
                profileHomeStore: .init(),
                profileWidthOfChangeStore: .init()
            )._printChanges()
        }
        .ifLet(\.workout, action: /Action.workout) {
            WorkoutRootStore()._printChanges()
        }
        .ifLet(\.profile, action: /Action.profile) {
            ProfileRootStore()._printChanges()
        }

    }
}
