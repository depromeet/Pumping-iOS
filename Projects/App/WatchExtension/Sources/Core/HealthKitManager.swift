//
//  HealthKitManager.swift
//  AppWatchExtension
//
//  Created by 송영모 on 2023/06/25.
//

import Foundation

import HealthKit

public protocol HealthKitManagerType {
    /// HealthStore
    var healthStore: HKHealthStore { get }
    
    /// HealthKit에 대한 인증을 진행하고, 백그라운드 딜리버리를 등록합니다.
    ///
    /// - Parameters:
    ///   - toShare: 쓰기 목록
    ///   - read: 읽기 목록
    func requestAuthorizationAndRegisterBackgroundDelivery(toShare: Set<HKSampleType>?, read: Set<HKSampleType>?)
    
    /// HKSampleType에 대한 변경 점을 Observe 하여, 데이터를 계속해서 받아옵니다.
    ///
    /// - Parameters:
    ///   - toObserve: 구독 목록
    func requestObserverQuery(
        toObserve: Set<HKSampleType>?,
        updateAnchorQueryHandler: @escaping (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void
    )
}

public class HealthKitManager: HealthKitManagerType {
    public static let shared = HealthKitManager()
    public let healthStore = HKHealthStore()
    
    public func requestAuthorizationAndRegisterBackgroundDelivery(
        toShare: Set<HKSampleType>? = nil,
        read: Set<HKSampleType>? = nil
    ) {
        requestAuthorization(toShare: toShare, read: read) { [weak self] (success, errorOrNil) in
            self?.registerBackgroundDelivery(targets: read)
        }
    }
    
    public func requestAuthorizationAndObserverQuery(
        toShare: Set<HKSampleType>? = nil,
        toObserve: Set<HKSampleType>? = nil
    ) {
        let writeDataTypes = toShare ?? self.dataTypesToWrite()
        let readDataTypes = toObserve ?? self.dataTypesToRead()
    }
    
    public func requestObserverQuery(
        toObserve: Set<HKSampleType>? = nil,
        updateAnchorQueryHandler: @escaping (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void
    ) {
        let readDataTypes = toObserve ?? self.dataTypesToRead()
        
        for readDataType in readDataTypes {
            let query = HKObserverQuery(sampleType: readDataType, predicate: nil) { [weak self] (query, completion, errorOrNil) in
                self?.requestAnchorQuery(toAnchor: readDataType, updateHandler: updateAnchorQueryHandler)
            }

            self.healthStore.execute(query)
        }
    }
    
    private func requestAnchorQuery(
        toAnchor: HKSampleType,
        updateHandler: @escaping (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void
    ) {
        let query = HKAnchoredObjectQuery(
            type: toAnchor,
            predicate: nil,
            anchor: nil,
            limit: HKObjectQueryNoLimit,
            resultsHandler: updateHandler)
        
        healthStore.execute(query)
    }
    
    public func requestAuthorization(
        toShare: Set<HKSampleType>? = nil,
        read: Set<HKSampleType>? = nil,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let writeDataTypes = toShare ?? self.dataTypesToWrite()
        let readDataTypes = read ?? self.dataTypesToRead()
        
        let typesToShare: Set = [
            HKQuantityType.workoutType()
        ]

        let typesToRead: Set = [
            // 심박수와 칼로리 소모만 가져옴
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
//            HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!,
//            HKQuantityType.quantityType(forIdentifier: .distanceCycling)!,
            HKObjectType.activitySummaryType()
        ]
        
        healthStore.requestAuthorization(
            toShare: typesToShare,
            read: typesToRead,
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
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
        ])
    }
    
    private func dataTypesToWrite() -> Set<HKSampleType> {
        return .init([
            HKQuantityType.workoutType()
        ])
    }
}
