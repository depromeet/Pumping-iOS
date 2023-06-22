//
//  WorkoutEndDIContainer.swift
//  FeatureWorkout
//
//  Created by 송영모 on 2023/06/21.
//

import SwiftUI

import ComposableArchitecture

import FeatureWorkoutInterface

class WorkoutEndDIContainer {
    static let shared = WorkoutEndDIContainer()
    
    private init() {}
    
    func resolve(store: StoreOf<WorkoutEndStore>) -> WorkoutEndView<some View> {
        return .init() {
            self.makeView(store: store)
        }
    }
}
