//
//  OtherProfile.swift
//  FeatureOnboardingInterface
//
//  Created by 송영모 on 2023/05/11.
//

import SwiftUI
import ComposableArchitecture

public struct OnboardingProfileView : View {
    public let store: StoreOf<OnboadingProfileStore>
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack{
                TabView {
                    Color.red
                    Color.yellow
                    Color.blue
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .frame(height: 300)
                
                ScrollView {
                    VStack {
                        ForEach(0..<10) { i in
                            cell(viewStore, index: i)
                                .padding()
                                .background(Color(UIColor.systemGray5))
                                .cornerRadius(10)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            
            Spacer()
        }
    }
    
    @ViewBuilder
    func cell(_ store: ViewStore<OnboadingProfileStore.State, OnboadingProfileStore.Action>, index: Int) -> some View {
        HStack {
            Circle()
                .frame(width: 50, height: 50)
            
            VStack {
                HStack {
                    Text("\(index)위 채령")
                    
                    Spacer()
                }
                .padding(.bottom, 5)
                
                HStack {
                    Text("운동 횟수 5회 운동 시간 02:40")
                    
                    Spacer()
                }
            }
        }
    }
}
