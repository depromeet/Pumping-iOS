//
//  WorkoutEndViewInterface.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/21.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem
import SharedUtil

public struct WorkoutEndView<Content: View>: View {
    private let store: StoreOf<WorkoutEndStore>
    public var content: () -> Content
    
    public init(store: StoreOf<WorkoutEndStore>, @ViewBuilder content: @escaping () -> Content) {
        self.store = store
        self.content = content
    }
    
    public var body: some View {
        content()
    }
}
