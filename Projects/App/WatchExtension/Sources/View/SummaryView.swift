////
////  SummaryView.swift
////  AppWatchExtension
////
////  Created by 박현우 on 2023/06/27.
////
//
//import Foundation
//import HealthKit
//import SwiftUI
//import WatchKit
//
//struct SummaryView: View {
//    @EnvironmentObject var workoutManager: WorkoutManager
//    @Environment(\.dismiss) var dismiss
//    @State private var durationFormatter: DateComponentsFormatter = {
//        let formatter = DateComponentsFormatter()
//        formatter.allowedUnits = [.hour, .minute, .second]
//        formatter.zeroFormattingBehavior = .pad
//        return formatter
//    }()
//    
//    var body: some View {
//        if workoutManager.workout == nil {
//            ProgressView("운동 결과를 저장 중 입니다.")
//                .navigationBarHidden(true)
//        } else {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    SummaryMetricView(title: "운동 시간",
//                                      value: durationFormatter.string(from: workoutManager.workout?.duration ?? 0.0) ?? "")
//                    .foregroundStyle(.yellow)
//                    
////                    SummaryMetricView(title: "총 거리",
////                                      value: Measurement(value: workoutManager.workout?.totalDistance?.doubleValue(for: .meter()) ?? 0,
////                                                         unit: UnitLength.meters)
////                                        .formatted(.measurement(width: .abbreviated,
////                                                                usage: .road,
////                                                                numberFormatStyle: .number.precision(.fractionLength(2)))))
//                    .foregroundStyle(.green)
//                    SummaryMetricView(title: "소모한 칼로리",
//                                      value: Measurement(value: workoutManager.workout?.totalEnergyBurned?.doubleValue(for: .kilocalorie()) ?? 0,
//                                                         unit: UnitEnergy.kilocalories)
//                                        .formatted(.measurement(width: .abbreviated,
//                                                                usage: .workout,
//                                                                numberFormatStyle: .number.precision(.fractionLength(0)))))
//                    .foregroundStyle(.pink)
//                    SummaryMetricView(title: "평균 심박수",
//                                      value: workoutManager.averageHeartRate.formatted(.number.precision(.fractionLength(0))) + " bpm")
//                    .foregroundStyle(.red)
//                    
//                    Text("활동 링")
//                    ActivityRingsView(healthStore: workoutManager.healthStore)
//                        .frame(width: 50, height: 50)
//                    
//                    Button("확인") {
//                        dismiss()
//                    }
//                }
//                .scenePadding()
//            }
//            .navigationTitle("운동 요약")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//    }
//}
//
//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView()
//    }
//}
//
//struct SummaryMetricView: View {
//    var title: String
//    var value: String
//    
//    var body: some View {
//        Text(title)
//            .foregroundStyle(.foreground)
//        Text(value)
//            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
//        Divider()
//    }
//}
