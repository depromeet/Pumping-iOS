//
//  HealthKitAuthorizationHelper.swift
//  CoreHealthKitManagerInterface
//
//  Created by 박현우 on 2023/06/03.
//

import Foundation
import HealthKit
import CoreHealthKitManagerInterface

public final class HealthKitAuthorizationHelper : HealthKitAuthorizationHelperInterface {
    
    static public let shared = HealthKitAuthorizationHelper()
    
    private let healthStore = HKHealthStore()
    
    private init() { }
    
    let readAndshare = Set(
        [
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRateVariabilitySDNN)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.restingHeartRate)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)!,
            HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.activeEnergyBurned)!
        ]
    )
    
    public func checkAuthorizationAndRequest(onSuccess : @escaping () -> Void, onFailure : @escaping () -> Void) {
        // 데이터 접근 가능 여부에 따라 권한 요청 메소드 호출
        if HKHealthStore.isHealthDataAvailable() && !checkAuthorizationStatus() {
            requestAuthorization(onSuccess: onSuccess, onFailure : onFailure)
        }
    }
    
    // 권한 요청 메소드
    private func requestAuthorization(onSuccess : @escaping () -> Void, onFailure : @escaping () -> Void) {
        self.healthStore.requestAuthorization(toShare: readAndshare, read: readAndshare) { success, error in
            DispatchQueue.main.async {
                if error != nil {
                    print(error.debugDescription)
                } else {
                    if success {
                        onSuccess()
                        print("권한이 허락되었습니다")
                    } else {
                        onFailure()
                        print("권한이 없습니다")
                    }
                }
            }
        }
    }
    
    private func checkAuthorizationStatus() -> Bool {
        let authorizationStatus = healthStore.authorizationStatus(for: .workoutType())
        
        switch authorizationStatus {
        case .notDetermined:
            // 권한이 아직 요청되지 않음
            return false
        case .sharingDenied:
            // 권한 거부됨
            return false
        case .sharingAuthorized:
            // 권한 부여됨
            return true
        default:
            return false
        }
    }
}
