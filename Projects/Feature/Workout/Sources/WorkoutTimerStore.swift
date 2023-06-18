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
                      let targetTimerInfoIndex = state.workoutTimerInfos.firstIndex(where: { $0.id == targetTimerCell.id }) else { return .none }
                
                var newTimerInfo = state.workoutTimerInfos[targetTimerInfoIndex]
                newTimerInfo.second += Int(Date().timeIntervalSince1970) - newTimerInfo.startPoint
                newTimerInfo.startPoint = Int(Date().timeIntervalSince1970)
                
                return .send(.updateTimerInfo(index: targetTimerInfoIndex, info: newTimerInfo))
                
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
                        guard let timerInfoIndex = state.workoutTimerInfos.firstIndex(where: { $0.id == id }) else { return .none }
                        var newTimerInfo = state.workoutTimerInfos[timerInfoIndex]
                        newTimerInfo.isActive = false
                        
                        return .send(.updateTimerInfo(index: timerInfoIndex, info: newTimerInfo))
                    } else {
                        if let prevCellID = state.currentActiveTimerCellID {
                            guard let timerInfoIndex = state.workoutTimerInfos.firstIndex(where: { $0.id == prevCellID }) else { return .none }
                            var newTimerInfo = state.workoutTimerInfos[timerInfoIndex]
                            newTimerInfo.isActive = false
                            return .concatenate([
                                .send(.updateTimerInfo(index: timerInfoIndex, info: newTimerInfo)),
                                .send(.showCounter(id: id))
                            ])
                        } else {
                            return .send(.showCounter(id: id))
                        }
                    }
                }
                
            case let .updateTimerCell(index, timerCellState):
                state.timerCells.update(timerCellState, at: index)
                return .none
                
            case let .updateTimerInfo(index, info):
                state.workoutTimerInfos[index] = info
                return .send(.updateTimerCell(index: index, state: .init(id: info.id, title: info.categoryIdentifier.rawValue, second: info.second, isActive: info.isActive)))
                
            case let .counter(action):
                switch action {
                case let .dismiss(id):
                    state.counter = nil
                    state.currentActiveTimerCellID = id
                    state.isTimerActive = true
                    
                    guard let timerInfoIndex = state.workoutTimerInfos.firstIndex(where: { $0.id == id }) else { return .none }
                    let targetTimerInfo = state.workoutTimerInfos[timerInfoIndex]
                    let newTimerInfo = WorkoutTimerInfo(id: targetTimerInfo.id, categoryIdentifier: targetTimerInfo.categoryIdentifier, second: targetTimerInfo.second, startPoint: Int(Date().timeIntervalSince1970), isActive: true)

                    return .concatenate([
                        .send(.updateTimerInfo(index: timerInfoIndex, info: newTimerInfo)),
                        .send(.timerStart)
                    ])
                    
                default:
                    return .none
                }
                
            case .goToWorkoutEnd:
                return .none
                
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
