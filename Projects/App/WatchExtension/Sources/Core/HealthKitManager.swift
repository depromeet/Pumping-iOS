//
//  HealthKitManager.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/25.
//

import Foundation

import HealthKit

public protocol HealthKitManagerType {
    /// HealthKit에 대한 인증을 진행하고, 백그라운드 딜리버리를 등록합니다.
    ///
    /// - Parameters:
    ///   - toShare: 쓰기 목록
    ///   - read: 읽기 목록
    func requestAuthorizationAndRegisterBackgroundDelivery(toShare: Set<HKSampleType>?, read: Set<HKSampleType>?)
    
    /// HKSampleType에 대한 변경 점을 Observe 하여, 데이터를 계속해서 받아옵니다.
    ///
    /// - Parameters:
    ///   - toObserve: 구독
    func requestObserverQuery(toObserve: HKSampleType)
}

public class HealthKitManager: HealthKitManagerType {
    public static let shared = HealthKitManager()
    
    private let healthStore = HKHealthStore()
    
    public func requestAuthorizationAndRegisterBackgroundDelivery(
        toShare: Set<HKSampleType>? = nil,
        read: Set<HKSampleType>? = nil
    ) {
        requestAuthorization(toShare: toShare, read: read) { [weak self] (success, errorOrNil) in
            self?.registerBackgroundDelivery(targets: read)
        }
    }
    
    public func requestObserverQuery(toObserve: HKSampleType) {
        let query = HKObserverQuery(sampleType: toObserve, predicate: nil) { (query, completion, errorOrNil) in
            debugPrint("\(toObserve) changed")
        }

        self.healthStore.execute(query)
    }
    
    private func requestAuthorization(
        toShare: Set<HKSampleType>? = nil,
        read: Set<HKSampleType>? = nil,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let writeDataTypes = toShare ?? self.dataTypesToWrite()
        let readDataTypes = read ?? self.dataTypesToRead()
        
        healthStore.requestAuthorization(
            toShare: toShare,
            read: read,
            completion: completion
        )
    }
    
    private func registerBackgroundDelivery(targets: Set<HKSampleType>? = nil) {
        let readDataTypes = targets ?? self.dataTypesToRead()
        
        for readDataType in readDataTypes {
            self.healthStore.enableBackgroundDelivery(
                for: readDataType,
                frequency: .immediate,
                withCompletion: { (success, errorOrNil) in
                    debugPrint("register background delivery \(success)")
                }
            )
        }
    }
    
    
    private func dataTypesToRead() -> Set<HKSampleType> {
        return .init([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        ])
    }
    
    private func dataTypesToWrite() -> Set<HKSampleType> {
        return .init([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
        ])
    }
}
