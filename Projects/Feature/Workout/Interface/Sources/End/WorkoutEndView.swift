//
//  WorkoutEndView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/05/23.
//

import SwiftUI

import ComposableArchitecture

import SharedDesignSystem

public struct WorkoutEndView: View {
    public let store: StoreOf<WorkoutEndStore>
    
    public init(store: StoreOf<WorkoutEndStore>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                VStack {
                    HStack {
                        Text("운동을 모두 끝냈어요!")
                            .font(.pretendard(size: 24, type: .bold))
                            .foregroundColor(SharedDesignSystemAsset.Colors.colorGrey100.swiftUIColor)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("오늘 한 운동 세트를 기록할 수 있어요")
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(.colorGrey000)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    SharedDesignSystemAsset.Images.boy.swiftUIImage
                }
                .background(Color.colorCyan300)
                
                HStack {
                    HStack {
                        Spacer()
                        
                        VStack(spacing: 4) {
                            Text("오늘 운동 시간")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(.colorCyan300)
                            
                            Text("01:00:00")
                                .font(.pretendard(size: 24, type: .bold))
                                .foregroundColor(.colorGrey900)
                        }
                        
                        Spacer()
                        
                        VStack(spacing: 4) {
                            Text("소모 칼로리")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(.colorCyan300)
                            
                            Text("300kcal")
                                .font(.pretendard(size: 24, type: .bold))
                                .foregroundColor(.colorGrey900)
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.colorGrey100)
                    .cornerRadius(12)
                    .offset(.init(width: 0, height: -40))
                    
                }
                .padding()
                
                HStack {
                    Text("오늘 한 운동")
                        .font(.pretendard(size: 18, type: .bold))
                        .foregroundColor(Color.colorGrey900)
                    
                    Spacer()
                    
                    Text("세트 기록")
                        .font(.pretendard(size: 16, type: .bold))
                        .foregroundColor(Color.colorGrey600)
                    
                    Image(systemName: "highlighter")
                        .imageScale(.medium)
                        .foregroundColor(.colorCyan300)
                    
                    //TODO: TextCellView Merge 후 작업 예정
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    viewStore.send(.completeButtonTapped)
                }, label: {
                    Text("완료")
                        .font(.pretendard(size: 18, type: .bold))
                        .foregroundColor(.colorGrey000)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                })
                .background(Color.colorCyan300)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom, 34)
            }
        }
    }
}
