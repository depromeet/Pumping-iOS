////
////  StartView.swift
////  AppWatchExtension
////
////  Created by 박현우 on 2023/06/27.
////
//
//import SwiftUI
//import HealthKit
//
//struct StartView: View {
//    @EnvironmentObject var workoutManager: WorkoutManager
//
//    var body: some View {
//        VStack {
//            Button {
//                workoutManager.startWorkout(workoutType: .functionalStrengthTraining)
//            } label: {
//                Circle()
//                    .fill(Color.blue)
//                    .overlay {
//                        Text("운동 시작")
//                            .foregroundStyle(.white)
//                    }
//            }
//            .clipShape(Circle())
//            .font(.system(size: 20, weight: .bold))
//            .tint(.blue)
//        }
//        .navigationDestination(isPresented: $workoutManager.isStartWorkout) {
//            SessionPagingView()
//        }
//    }
//}
//
//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//            .environmentObject(WorkoutManager())
//    }
//}
