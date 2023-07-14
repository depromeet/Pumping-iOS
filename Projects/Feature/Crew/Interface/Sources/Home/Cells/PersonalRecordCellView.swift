//
//  PersonalRecordCellView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct PersonalRecordCellView: View {
    public let store: StoreOf<PersonalRecordCellStore>

    public init(store: StoreOf<PersonalRecordCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 0) {
                Spacer()
                
                personalInformationView(viewStore: viewStore)
                
                Spacer()
                
                Divider()
                    .background(Color.colorGrey100)
                   
            }
            .frame(height: 96)
            .onTapGesture {
                viewStore.send(.tapped)
            }
        }
    }
    
    private func personalInformationView(viewStore : ViewStoreOf<PersonalRecordCellStore>) -> some View {
        HStack(spacing: 15) {
            Circle()
                .frame(width: 60, height: 60)
                .overlay {
                    SharedDesignSystemAsset.Images.avatarHead.swiftUIImage
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .foregroundColor(.black)
                }

            VStack(alignment: .leading) {
                HStack {
                    HStack {
                        Text("나")
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(Color.colorCyan300)
                            .padding(.init(top: 5, leading: 9, bottom: 5, trailing: 9))
                    }
                    .background(Color.colorCyan50)
                    .cornerRadius(13)

                    Text("\(viewStore.ranking)위")
                        .font(.pretendard(size: 16, type: .extraBold))
                        .foregroundColor(Color.colorCyan300)

                    Text(viewStore.userName)
                        .font(.pretendard(size: 16, type: .extraBold))
                        .foregroundColor(Color.colorGrey800)
                }

                HStack {
                    Text("운동 목표 횟수")
                        .font(.pretendard(size: 14, type: .extraLight))
                        .foregroundColor(Color.colorGrey500)

                    Text(viewStore.numberOfExerciseGoals)
                        .font(.pretendard(size: 14, type: .medium))
                        .foregroundColor(Color.colorGrey600)

                    Text("•")
                        .foregroundColor(Color.colorGrey400)

                    Text("운동 시간")
                        .font(.pretendard(size: 14, type: .extraLight))
                        .foregroundColor(Color.colorGrey500)

                    Text(viewStore.workoutTime)
                        .font(.pretendard(size: 14, type: .medium))
                        .foregroundColor(Color.colorGrey600)
                }
            }

            Spacer()
        }
    }
}

