//
//  HealthClient.swift
//  DomainHealthInterface
//
//  Created by 송영모 on 2023/06/25.
//

import Foundation
import HealthKit

import ComposableArchitecture

import DomainHealthInterface
import Core


extension HealthClient: DependencyKey {
    public static let liveValue = HealthClient(
        loadHeartRate: {
//            return HealthKitManager.shared.getQuantityTypeSamples(identifier: .heartRate, predicate: , completion: {
//
//            })
//            HealthKitManager.shared.excuteObservingQuentityType(identifier: HKQuantityTypeIdentifier.heartRate)
            return 10
        }
    )
}

extension DependencyValues {
    public var healthClient: HealthClient {
        get { self[HealthClient.self] }
        set { self[HealthClient.self] = newValue }
    }
}
