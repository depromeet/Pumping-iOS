//
//  HomeView.swift
//  FeatureHome
//
//  Created by 송영모 on 2023/05/19.
//

import SwiftUI

import ComposableArchitecture

import FeatureHomeInterface

extension HomeView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("hi")
            }
        }
    }
}
