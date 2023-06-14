//
//  HomeRootStoreInterface.swift
//  FeatureHomeInterface
//
//  Created by Derrick kim on 2023/06/13.
//

import ComposableArchitecture
import SharedDesignSystem

public enum HomeScene: Hashable {
    case home
}

public struct HomeRootStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    private let homeStore: HomeStore
    
    public init(
        reducer: Reduce<State, Action>,
        homeStore: HomeStore
    ) {
        self.reducer = reducer
        self.homeStore = homeStore
    }
    
    public struct State: Equatable {
        @BindingState public var path: [HomeScene] = []

        public var userRecordList: IdentifiedArrayOf<PersonalRecordCellStore.State> = [
            .init(id: .init(), avatarName: "몰라", ranking: "4", userName: "보민", numberOfExerciseGoals: "3 / 5회", workoutTime: "02:40"),
            .init(id: .init(), avatarName: "몰라", ranking: "1", userName: "희원", numberOfExerciseGoals: "3 / 5회", workoutTime: "02:40"),
            .init(id: .init(), avatarName: "몰라", ranking: "2", userName: "채령", numberOfExerciseGoals: "3 / 5회", workoutTime: "02:40"),
            .init(id: .init(), avatarName: "몰라", ranking: "5", userName: "영모", numberOfExerciseGoals: "3 / 5회", workoutTime: "02:40"),
            .init(id: .init(), avatarName: "몰라", ranking: "3", userName: "현우", numberOfExerciseGoals: "3 / 5회", workoutTime: "02:40")
        ]

        public var profileList: IdentifiedArrayOf<ProfileBodyCellStore.State> = [
            .init(id: .init(), ranking: "5", userName: "보민", workoutTime: "00:00:00"),
            .init(id: .init(), ranking: "1", userName: "현우", workoutTime: "00:00:00"),
            .init(id: .init(), ranking: "2", userName: "영모", workoutTime: "00:00:00"),
            .init(id: .init(), ranking: "3", userName: "희원", workoutTime: "00:00:00"),
            .init(id: .init(), ranking: "4", userName: "데릭", workoutTime: "00:00:00")
        ]

        public var home: HomeStore.State? = .init()
        
        public init() {
            
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case home(HomeStore.Action)
        case profileBodyCell(id: ProfileBodyCellStore.State.ID, action: ProfileBodyCellStore.Action)
        case personalRecordCell(id: PersonalRecordCellStore.State.ID, action: PersonalRecordCellStore.Action)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.home, action: /Action.home) {
                homeStore
            }
    }
}
