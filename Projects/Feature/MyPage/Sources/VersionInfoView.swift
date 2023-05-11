//
//  VersionInfoView.swift
//  FeatureMyPage
//
//  Created by 송영모 on 2023/05/09.
//

import SwiftUI

import ComposableArchitecture

import FeatureMyPageInterface

extension VersionInfoView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("version info view")
            }
        }
    }
}
