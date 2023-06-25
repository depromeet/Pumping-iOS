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
    
    var body: some View {
        VStack {
            TabView {
                Text("The First Tab")
                  .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                  }
                Text("Another Tab")
                  .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                  }
            }
            
            Spacer()
            
            HStack {
                Button("Register") {
//                    HealthKitManager.shared.observe()
                }
                    .background(.blue)
             
                Spacer()
                
                Button("OK") {
//                    HealthKitManager.shared.setting()
                }
                    .background(.blue)
            }
            .buttonStyle(.plain)
        }
    }
}
