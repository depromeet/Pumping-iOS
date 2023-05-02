////
////  OnboardingThirdView.swift
////  FeatureOnboarding
////
////  Created by 송영모 on 2023/04/30.
////
//
//import SwiftUI
//import FeatureOnboardingInterface
//import ComposableArchitecture
//
//public struct OnboardingThirdView: OnboardingScreen {
//    @Binding var path: NavigationPath
//    
//    public init(path: Binding<NavigationPath>) {
//        _path = path
//    }
//    
//    public var body: some View {
//        VStack {
//            Text("Third View \(path.count)")
//                .padding()
//            
//            Button(action: {
//                self.path = .init()
//            }, label: {
//                Text("pop to root")
//            })
//            .padding()
//            
//            Button(action: {
//                self.path.removeLast()
//            }, label: {
//                Text("prev")
//            })
//            .padding()
//        }
//    }
//}
