//
//  OtherProfileDetail.swift
//  FeatureOnboarding
//
//  Created by 송영모 on 2023/05/12.
//

import ComposableArchitecture
import Foundation

public struct OtherProfileDetailStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        public let index: Int
        public let week: [Week] = Week.data
        
        public init(index: Int) {
            self.index = index
        }
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)

        case tapHeartButton
        case tapComparisonButton
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}


public struct OtherProfileDetailView {
    public let store: StoreOf<OtherProfileDetailStore>
    
    public init(store: StoreOf<OtherProfileDetailStore>) {
        self.store = store
    }
}

public struct Week: Hashable, Identifiable {
    public let id = UUID()
    public let day: String
}

extension Week {
    static let data = [Week(day: "월"),
                       Week(day: "화"),
                       Week(day: "수"),
                       Week(day: "목"),
                       Week(day: "금"),
                       Week(day: "토"),
                       Week(day: "일"),]
}
