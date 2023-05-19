//
//  ProfileRootView.swift
//  FeatureProfileInterface
//
//  Created by 송영모 on 2023/05/19.
//

import SwiftUI

import ComposableArchitecture

import FeatureProfileInterface

extension ProfileRootView: View {
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationStack(path: viewStore.binding(\.$path)) {
                VStack {
                    VStack {
                        
                    }
                    
                    ScrollView {
                        VStack {
                            HStack {
                                Text("내 운동량")
                                
                                Button("변화폭") {
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
