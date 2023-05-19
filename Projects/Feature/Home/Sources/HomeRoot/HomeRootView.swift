//
//  HomeRootView.swift
//  FeatureHomeInterface
//
//  Created by 송영모 on 2023/05/19.
//

import SwiftUI

import ComposableArchitecture

import FeatureHomeInterface

extension HomeRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    Text("홈 화면 구현")
                }
            }
        }
    }
}
