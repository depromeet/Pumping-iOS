//
//  WorkoutCounterView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutCounterView: View {
    public let store: StoreOf<WorkoutCounterStore>
    
    public init(store: StoreOf<WorkoutCounterStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Text("\(viewStore.count)")
                    
                    Spacer()
                    
                }
                Spacer()
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}
