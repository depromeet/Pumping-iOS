//
//  MyPageRootView.swift
//  FeatureMyPageInterface
//
//  Created by 송영모 on 2023/05/09.
//

import SwiftUI

import ComposableArchitecture

import FeatureMyPageInterface

extension MyPageRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    Text("MyPage Root View")
                }
                .navigationDestination(for: MyPageScene.self) { scene in
                    switch scene {
                    case .userInfo:
                        IfLetStore(self.store.scope(state: \.userInfo, action: { .userInfo($0) })) {
                            UserInfoView(store: $0)
                        }
                        
                    default:
                        EmptyView()
                    }
                }
            }
        }
    }
}
