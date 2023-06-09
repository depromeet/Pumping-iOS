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
            switch self {
            case .time:
                return DateManager.toClockString(from: Int(value))
                
            case .heatRate:
                if value == 0 {
                    return "-"
                } else {
                    return String(describing: "\(Int(value))bpm")
                }
                
            case .calorie:
                if value == 0 {
                    return "-"
                } else {
                    return String(describing: "\(Int(value))Kcal")
                }
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
        public let selectedWorkoutCategoryIdentifiers: [WorkoutPart]
        
        public var timers: [PumpingTimer] = []
        public var time: Int = 0
        public var heartRateToCalc: Double = 0.0
        public var heartRateToShow: Double = 0.0
        public var calorieToCalc: Double = 0.0
        public var calorieToShow: Double = 0.0
        
        public var isTimerActive: Bool = false
        public var currentActiveTimerCellID: UUID?
        
        public var timerCells: IdentifiedArrayOf<WorkoutTimerCellStore.State> = []
        public var counter: WorkoutCounterStore.State? = .init(id: nil)
        
        public init(selectedWorkoutCategoryIdentifiers: [WorkoutPart]) {
            self.selectedWorkoutCategoryIdentifiers = selectedWorkoutCategoryIdentifiers
            
            self.timers = self.makeTimers(from: selectedWorkoutCategoryIdentifiers)
            self.timerCells = self.makeTimerCells(from: self.timers)
        }
        
        private func makeTimers(from workoutCategoryIdentifiers: [WorkoutPart]) -> [PumpingTimer] {
            return workoutCategoryIdentifiers.map { workoutCategoryIdentifier in
                return .init(id: .init(), workoutCategoryIdentifier: workoutCategoryIdentifier)
            }
        }
        
        private func makeTimerCells(from timers: [PumpingTimer]) -> IdentifiedArrayOf<WorkoutTimerCellStore.State> {
            return .init(uniqueElements: timers.map { timer in
                return .init(id: timer.id, timer: timer)
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
        
        case timerCell(id: WorkoutTimerCellStore.State.ID, action: WorkoutTimerCellStore.Action)
        case counter(WorkoutCounterStore.Action)
        
        case updateHeartRate(Double)
        case updateCalorie(Double)
        case updateTimer(index: Int, timer: PumpingTimer)
        case updateTimerCell(index: Int, state: WorkoutTimerCellStore.State)
        
        //MARK: Navigation
        case goToWorkoutEnd(timers: [PumpingTimer])
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
