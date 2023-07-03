//
//  HealthKitManagerType.swift
//  CoreHealthKitInterface
//
//  Created by 송영모 on 2023/07/03.
//

import Foundation

import HealthKit

public protocol HealthKitManagerType {
    /// HealthKit에 대한 인증을 진행하고, 백그라운드 딜리버리를 등록합니다.
    ///
    /// - Parameters:
    ///   - toShare: 쓰기 목록
    ///   - toRead: 읽기 목록
    func requestAuthorizationAndRegisterBackgroundDelivery(
        toShare: Set<HKSampleType>?,
        toRead: Set<HKSampleType>?
    )
    
    /// HKSampleType에 대한 변경 점을 Observe 하여, 데이터를 계속해서 받아옵니다.
    ///
    /// - Parameters:
    ///   - toObserve: 구독 목록
    ///   - updateAnchorQueryHandler: 업데이트 핸들러
    func requestObserverQuery(
        toObserve: Set<HKSampleType>?,
        updateAnchorQueryHandler: @escaping (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void
    )
}
