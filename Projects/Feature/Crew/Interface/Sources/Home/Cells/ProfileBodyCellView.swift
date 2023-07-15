//
//  ProfileBodyCellView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/14.
//

import SwiftUI
import ComposableArchitecture
import SharedDesignSystem

public struct ProfileBodyCellView: View {
    public let store: StoreOf<ProfileBodyCellStore>

    public init(store: StoreOf<ProfileBodyCellStore>) {
        self.store = store
    }

    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 40) {
                    VStack(alignment: .leading, spacing: 10) {
                        VStack(alignment: .leading) {
                            Text("\(viewStore.ranking)위")
                                .font(.pretendard(size: 13, type: .medium))
                                .foregroundColor(.colorGrey800)
                            
                            Text(viewStore.userName)
                                .font(.tenada(size: 32))
                                .foregroundColor(.colorGrey900)
                                .baselineOffset(-5)
                        }

                        VStack(alignment: .leading) {
                            Text("운동 시간")
                                .font(.pretendard(size: 13, type: .medium))
                                .foregroundColor(.colorGrey800)

                            Text(viewStore.workoutTime)
                                .font(.tenada(size: 32))
                                .foregroundColor(.colorGrey900)
                                .baselineOffset(-5)
                        }
                    }

//                    Button {
//
//                    } label: {
//                        SharedDesignSystemAsset.Images.thumbsUp.swiftUIImage
//                            .frame(maxWidth: .infinity, maxHeight: .infinity)
//                            .foregroundColor(.black)
//                    }
//                    .frame(width: 60, height: 60)
//                    .background(.white)
//                    .clipShape(Circle())
                }
                .offset(x: -10)

                viewStore.characterType.getCharacterImage()
            }
        }
    }
}
