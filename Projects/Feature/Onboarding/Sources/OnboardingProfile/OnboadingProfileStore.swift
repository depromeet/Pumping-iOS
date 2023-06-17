//
//  OtherProfileStore.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import ComposableArchitecture
import FeatureOnboardingInterface

extension OnboadingProfileStore {
    
    public init() {
        let reducer: Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .binding:
                return .send(.checkAllSatisfied)
                
            case let .setGender(gender):
                state.gender = gender
                return .none
                
            case .checkAllSatisfied:
                // TODO: 이 부분을 별도의 function으로 분리하는 방법에 대해 고민 (protocol로 분리해봤지만 self가 초기화되기전에 사용하지 못하는 문제 발생)
                if !state.name.isEmpty &&
                    state.name.count <= state.maxCount &&
                    state.height != 0 &&
                    state.weight != 0
                {
                    state.isSatisfied = true
                } else {
                    state.isSatisfied = false
                }
                
                return .none
                
            default :
                return .none
            }
        }
        
        self.init(reducer: reducer)
    }
}
