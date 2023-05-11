//
//  OtherProfile.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import SwiftUI

import ComposableArchitecture

import FeatureOnboardingInterface

extension OtherProfileView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            
        }
    }
}
