//
//  OtherProfile.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture

public struct OnboadingProfileStore: ReducerProtocol {
    private let reducer: Reduce<State, Action>
    
    public init(reducer: Reduce<State, Action>) {
        self.reducer = reducer
    }
    
    public struct State: Equatable {
        @BindingState public var name : String = ""
        public var maxCount : Int = 15
        public var gender : GenderType?
        @BindingState public var height : Int = 0
        @BindingState public var weight : Int = 0
        public var isSatisfied : Bool = false
        
        public init() {}
    }
    
    public enum Action: BindableAction, Equatable {
        case binding(BindingAction<State>)
        case setGender(GenderType)
        case checkAllSatisfied
        case moveToNextStep
    }
    
    public var body: some ReducerProtocol<State, Action> {
        BindingReducer()
        reducer
    }
}

public enum GenderType : String {
    case male = "남성"
    case female = "여성"
}
