//
//  RootView.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/26.
//

import SwiftUI

import ComposableArchitecture

struct RootView: View {
    public let store: StoreOf<RootStore>
    
    public init(store: StoreOf<RootStore>) {
        self.store = store
    }
    
    var body: some View {
        SwitchStore(self.store) {
            CaseLet(state: /RootStore.State.home, action: RootStore.Action.home) {
                HomeView(store: $0)
            }
        }
    }
}
