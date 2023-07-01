//
//  WorkoutTimerStore.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import Foundation
import ComposableArchitecture

import FeatureWorkoutInterface
import DomainWorkoutInterface
import SharedDesignSystem

extension WorkoutTimerStore {
    public init() {
        let BACKGROUND_TIME = 3
        
        @Dependency(\.continuousClock) var clock
        
        let reducer: Reduce<State, Action> = .init { state, action in
            switch action {
            case .binding:
                return .none
                
            case .onAppear:
                state.counter = .init(.init(id: nil))
                return .none
                
            case .endButtonTapped:
                return .send(.goToWorkoutEnd)
                
            case .timerTicked:
                guard let targetTimerCell = state.timerCells.first(where: { $0.id == state.currentActiveTimerCellID }),
                      let targetTimerIndex = state.timers.firstIndex(where: { $0.id == targetTimerCell.id }) else { return .none }
                
                var newTimer = state.timers[targetTimerIndex]
                var intervalTime = Int(Date().timeIntervalSince1970) - newTimer.pinTime
                intervalTime = intervalTime > BACKGROUND_TIME ? intervalTime : 1
                
                newTimer.time += intervalTime
                newTimer.pinTime = Int(Date().timeIntervalSince1970)
                
                state.time += intervalTime
                return .send(.updateTimer(index: targetTimerIndex, timer: newTimer))
                
            case .timerStart:
                return .run { [isTimerActive = state.isTimerActive] send in
                    guard isTimerActive else { return }
                    for await _ in clock.timer(interval: .seconds(1)) {
                        await send(.timerTicked)
                    }
                }
                .cancellable(id: TimerID.self, cancelInFlight: true)
                
            case let .timerCell(id, action):
                switch action {
                case .tapped:
                    if id == state.currentActiveTimerCellID {
                        state.currentActiveTimerCellID = nil
                        state.isTimerActive = false
                        guard let timerIndex = state.timers.firstIndex(where: { $0.id == id }) else { return .none }
                        var newTimer = state.timers[timerIndex]
                        newTimer.isActive = false
                        
                        return .concatenate([
                            .send(.updateTimer(index: timerIndex, timer: newTimer)),
                            .cancel(id: TimerID.self)
                        ])
                    } else {
                        if let prevCellID = state.currentActiveTimerCellID {
                            guard let timerIndex = state.timers.firstIndex(where: { $0.id == prevCellID }) else { return .none }
                            var newTimer = state.timers[timerIndex]
                            newTimer.isActive = false
                            return .concatenate([
                                .send(.updateTimer(index: timerIndex, timer: newTimer)),
                                .send(.showCounter(id: id))
                            ])
                        } else {
                            return .send(.showCounter(id: id))
                        }
                    }
                }
                
            case let .updateHeartRate(heartRate):
                state.heartRateToCalc = heartRate
                
                if let id = state.currentActiveTimerCellID {
                    state.heartRateToShow = heartRate
                    guard let timerIndex = state.timerCells.firstIndex(where: { $0.id == id }) else { return .none }
                    var targetTimer = state.timers[timerIndex]
                    targetTimer.heartRates.append(heartRate)

                    return .send(.updateTimer(index: timerIndex, timer: targetTimer))
                }
                
                return .none
                
            case let .updateCalorie(calorie):
                let diff = calorie - state.calorieToCalc
                state.calorieToCalc = calorie
                
                if let id = state.currentActiveTimerCellID {
                    state.calorieToShow += diff
                    guard let timerIndex = state.timerCells.firstIndex(where: { $0.id == id }) else { return .none }
                    var targetTimer = state.timers[timerIndex]
                    targetTimer.calorie += diff
                    
                    return .send(.updateTimer(index: timerIndex, timer: targetTimer))
                }
                
                return .none
                
            case let .updateTimerCell(index, timerCellState):
                state.timerCells.update(timerCellState, at: index)
                return .none
                
            case let .updateTimer(index, timer):
                state.timers[index] = timer
                return .send(.updateTimerCell(index: index, state: .init(id: timer.id, timer: timer)))
                
            case let .counter(action):
                switch action {
                case let .dismiss(id):
                    state.counter = nil
                    state.currentActiveTimerCellID = id
                    state.isTimerActive = true
                    
                    guard let timerIndex = state.timers.firstIndex(where: { $0.id == id }) else { return .none }
                    let targetTimer = state.timers[timerIndex]
                    let newTimer = PumpingTimer(
                        id: targetTimer.id,
                        workoutCategoryIdentifier: targetTimer.workoutCategoryIdentifier,
                        time: targetTimer.time,
                        pinTime: Int(Date().timeIntervalSince1970),
                        isActive: true
                    )
                    
                    return .concatenate([
                        .send(.updateTimer(index: timerIndex, timer: newTimer)),
                        .send(.timerStart)
                    ])
                    
                default:
                    return .none
                }
                
            case .goToWorkoutEnd:
                return .cancel(id: TimerID.self)
                
            case let .showCounter(id):
                state.counter = .init(id: id)
                return .none
            }
        }
        
        self.init(
            reducer: reducer,
            workoutCounterStore: .init()
        )
    }
}
