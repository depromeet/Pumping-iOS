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
                        HStack {
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .frame(height: 300)
                    .background(.blue)
                    
                    ScrollView {
                        VStack {
                            HStack {
                                Text("내 운동량")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                Button("변화폭") {
                                    
                                }
                            }
                            .padding()
                            
                            HStack {
                                ForEach(Calendar.current.shortWeekdaySymbols, id: \.self) { weekday in
                                    VStack {
                                        Text(weekday)
                                        
                                        VStack {
                                            Circle()
                                                .fill(.blue)
                                                .padding(.init(top: 7, leading: 6, bottom: 25, trailing: 6))
                                        }
                                        .background(Color(.systemGray6))
                                        .cornerRadius(22)
                                    }
                                }
                            }
                            .padding()
                            
                            HStack(spacing: 8) {
                                ForEach(0...1, id: \.self) { i in
                                    VStack {
                                        HStack {
                                            Text("시간")
                                            
                                            Spacer()
                                        }
                                        .padding(.init(top: 16, leading: 16, bottom: 54, trailing: 16))
                                        
                                        HStack {
                                            Circle()
                                                .fill(.blue)
                                                .frame(width: 40, height: 40)
                                            
                                            Spacer()
                                            
                                            Text("1시간")
                                        }
                                        .padding(.init(top: 0, leading: 16, bottom: 16, trailing: 16))
                                    }
                                    .background(Color(.systemGray6))
                                    .cornerRadius(12)
                                }
                            }
                            .padding()
                            
                            VStack(spacing: .zero) {
                                ForEach(0...5, id: \.self) { i in
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("심박수 유지")
                                            
                                            Circle()
                                                .fill(.blue)
                                                .frame(width: 40, height: 40)
                                        }
                                        .padding(16)
                                        
                                        Spacer()
                                        
                                        VStack {
                                            Spacer()
                                            
                                            Text("평균 1시간")
                                            
                                            Text("200bpm")
                                        }
                                        .padding(16)
                                    }
                                    .background(Color(.systemGray6))
                                    .cornerRadius(12)
                                    .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
