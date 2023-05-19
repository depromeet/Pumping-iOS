//
//  WidthOfChangeView.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import SwiftUI

import ComposableArchitecture

import FeatureProfileInterface

extension WidthOfChangeView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text("이 기능은 다음 번에 만들게요.")
            }
        }
    }
}
