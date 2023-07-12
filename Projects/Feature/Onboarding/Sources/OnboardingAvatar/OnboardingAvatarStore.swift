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
            case let .getRandomCharacter(genderType):
                state.pickedCharacter = getRandomCharacter(genderType: genderType)
                state.isAvatarPicked = true
                return .none
                
            default:
                return .none
            }
        }
        
        self.init(
            reducer: reducer
        )
        
        func getRandomCharacter(genderType: GenderType?) -> CharacterType? {
            guard let genderType else {
                return nil
            }
            
            var characterTypes: [CharacterType] = []
            
            switch genderType {
            case .male:
                characterTypes = [.a, .b, .c, .d, .e, .f]
            case .female:
                characterTypes = [.g, .h, .i, .j, .k, .l]
            }
            
            let randomIndex = Int.random(in: 0..<characterTypes.count)
            return characterTypes[randomIndex]
        }
    }
}
