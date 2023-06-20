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
            //TODO: 서버에 넘겨야할 값에 따라 value 타입이 달라짐
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
        public var workoutTimerInfos: [WorkoutTimerInfo] = []
        
        public var second: Int = 0
        public var heartRate: Int = 100
        public var calorie: Int = 230
        
        public var isTimerActive: Bool = false
        public var currentActiveTimerCellID: UUID?
        
        public var timerCells: IdentifiedArrayOf<TimerCellStore.State> = []
        public var counter: WorkoutCounterStore.State? = .init(id: nil)
        
        public init(workoutCategoryIdentifiers: [WorkoutCategoryIdentifier]) {
            self.workoutTimerInfos = makeWorkoutTimerInfos(from: workoutCategoryIdentifiers)
            self.timerCells = makeIdentifiedArray(from: self.workoutTimerInfos)
        }
        
        private func makeWorkoutTimerInfos(from workoutCategoryIdentifiers: [WorkoutCategoryIdentifier]) -> [WorkoutTimerInfo] {
            return workoutCategoryIdentifiers.map { workoutCategoryIdentifier in
                return .init(id: .init(), categoryIdentifier: workoutCategoryIdentifier)
            }
        }
        
        private func makeIdentifiedArray(from infos: [WorkoutTimerInfo]) -> IdentifiedArrayOf<TimerCellStore.State> {
            return .init(uniqueElements: infos.map { info in
                return .init(id: info.id, title: info.categoryIdentifier.rawValue, second: info.second)
            })
        }
    }
    
    public enum TimerID {}
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        
        case onAppear
        
        case endButtonTapped
        case timerStart
        case timerTicked
        
        case timerCell(id: TimerCellStore.State.ID, action: TimerCellStore.Action)
        case counter(WorkoutCounterStore.Action)
        
        case updateTimerCell(index: Int, state: TimerCellStore.State)
        case updateTimerInfo(index: Int, info: WorkoutTimerInfo)
        
        //MARK: Navigation
        case goToWorkoutEnd
        case showCounter(id: UUID)
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
            .ifLet(\.counter, action: /Action.counter) {
                workoutCounterStore
            }
    }
}
