//
//  OnboardingCrewStore.swift
//  FeatureOnboardingInterface
//
//  Created by 박현우 on 2023/06/01.
//

import Foundation
import ComposableArchitecture
import FeatureOnboardingInterface
import Domain

extension OnboardingAvatarStore {
    public init() {
        let reducer : Reduce<State, Action> = Reduce { state, action in
            switch action {
            case .getRandomCharacter:
                state.pickedCharacter = getRandomCharacter()
                state.isAvatarPicked = true
                return .none
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
        
        func getRandomCharacter() -> CharacterType {
            let allCases = CharacterType.allCases
            let randomIndex = Int.random(in: 0..<allCases.count)
            return allCases[randomIndex]
        }
    }
}
