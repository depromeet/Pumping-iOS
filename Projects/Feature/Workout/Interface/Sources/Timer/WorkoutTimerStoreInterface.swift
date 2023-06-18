//
//  WorkoutTimer.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/24.
//

import SwiftUI

import ComposableArchitecture

import DomainWorkoutInterface
import SharedDesignSystem
import SharedUtil

public struct WorkoutTimerStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    private let workoutCounterStore: WorkoutCounterStore
    
    public enum ResultType {
        case time, heatRate, calorie
        
        public var title: String {
            switch self {
            case .time: return "총 시간"
            case .heatRate: return "심박수"
            case .calorie: return "총 칼로리"
            }
        }
        
        public var image: Image {
            switch self {
            case .time: return PumpingImages.clock.swiftUIImage
            case .heatRate: return PumpingImages.heart.swiftUIImage
            case .calorie: return PumpingImages.vital.swiftUIImage
            }
        }
        
        public func toSyntax(value: Double) -> String {
            //TODO: 서버에 넘거야할 값에 따라 value 타입이 달라짐
            switch self {
            case .time: return DateManager.toClockString(from: Int(value))
            case .heatRate: return String(describing: "\(Int(value))bpm")
            case .calorie: return String(describing: "\(Int(value))Kcal")
            }
        }
    }
    
    public init(
        reducer: Reduce<State, Action>,
        workoutCounterStore: WorkoutCounterStore
    ) {
        self.reducer = reducer
        self.workoutCounterStore = workoutCounterStore
    }
    
    public struct State: Equatable {
        public let workoutCategoryIdentifiers: [WorkoutCategoryIdentifier]
        
        public var timerCells: IdentifiedArrayOf<TimerCellStore.State> = []
        
        public var counter: WorkoutCounterStore.State? = .init()
        
        
        public init(workoutCategoryIdentifiers: [WorkoutCategoryIdentifier]) {
            self.workoutCategoryIdentifiers = workoutCategoryIdentifiers
            self.timerCells = makeIdentifiedArray(from: workoutCategoryIdentifiers)
        }
        
        private func makeIdentifiedArray(from ids: [WorkoutCategoryIdentifier]) -> IdentifiedArrayOf<TimerCellStore.State> {
            return .init(uniqueElements: ids.map { id in
                return .init(id: .init(), title: id.rawValue, second: 0)
            })
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        
        case endButtonTapped
        
        case timerCell(id: TimerCellStore.State.ID, action: TimerCellStore.Action)
        case counter(WorkoutCounterStore.Action)
        
        //MARK: Navigation
        case goToWorkoutEnd
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.counter, action: /Action.counter) {
                workoutCounterStore
            }
    }
}
