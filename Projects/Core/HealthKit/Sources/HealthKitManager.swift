//
//  HealthKitManager.swift
//  CoreHealthKit
//
//  Created by 송영모 on 2023/06/25.
//

import Foundation
import HealthKit

import CoreHealthKitInterface

public class HealthKitManager: HealthKitManagerType {
    public static let shared = HealthKitManager()
    
    public let healthStore = HKHealthStore()
    
    /// HealthKit에 대한 인증을 진행하고, 백그라운드 딜리버리를 등록합니다.
    ///
    /// - Parameters:
    ///   - toShare: 쓰기 목록
    ///   - toRead: 읽기 목록
    public func requestAuthorizationAndRegisterBackgroundDelivery(
        toShare: Set<HKSampleType>? = nil,
        toRead: Set<HKSampleType>? = nil
    ) {
        requestAuthorization(toShare: toShare, toRead: toRead) { [weak self] (success, errorOrNil) in
            self?.registerBackgroundDelivery(targets: toRead)
        }
    }
    
    /// HKSampleType에 대한 변경 점을 Observe 하여, 데이터를 계속해서 받아옵니다.
    ///
    /// - Parameters:
    ///   - toObserve: 구독 목록
    ///   - updateAnchorQueryHandler: 업데이트 핸들러
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
    
    /// HKSampleType에 대한 변경 점을 Observe 하여, 데이터를 계속해서 받아옵니다.
    ///
    /// - Parameters:
    ///   - toAnchor: 구독 목록
    ///   - updateHandler: 업데이트 핸들러
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

    /// HealthKit에 대한 접근 권한을 얻습니다.
    ///
    /// - Parameters:
    ///   - toAnchor: 구독 목록
    ///   - updateHandler: 업데이트 핸들러
    public func requestAuthorization(
        toShare: Set<HKSampleType>? = nil,
        toRead: Set<HKSampleType>? = nil,
        completion: @escaping (Bool, Error?) -> Void
    ) {
        let shareDataTypes = toShare ?? self.dataTypesToShare()
        let readDataTypes = toRead ?? self.dataTypesToRead()
        
        healthStore.requestAuthorization(
            toShare: shareDataTypes,
            read: readDataTypes,
            completion: completion
        )
    }
    
    /// HKSampleType에 대한 백그라운드 딜리버리를 등록합니다.
    ///
    /// - Parameters:
    ///   - targets: 등록할 타겟
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

    /// HealthKit에서 읽기 데이터의 목록 입니다.
    ///
    /// 심박수, 활동 에너지
    private func dataTypesToRead() -> Set<HKSampleType> {
        return .init([
            HKQuantityType.quantityType(forIdentifier: .heartRate)!,
            HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!,
        ])
    }
    
    /// HealthKit에서 쓰기 데이터의 목록 입니다.
    ///
    /// 운동
    private func dataTypesToShare() -> Set<HKSampleType> {
        return .init([
            HKQuantityType.workoutType()
        ])
    }
}
