//
//  HealthKitManagerInterface.swift
//  CoreHealthKit
//
//  Created by 송영모 on 2023/06/25.
//

import HealthKit

public protocol HealthKitManagerInterface {
    func getQuantityTypeObserver(
    )
    
//    func getQuantityTypeStatistics(
//        identifier: HKQuantityTypeIdentifier,
//        predicate: NSPredicate,
//        completion: @escaping ((HKStatistics?, HealthKitError?) -> Void)
//    )
//    
//    func getQuantityTypeSamples(identifier: HKQuantityTypeIdentifier,
//                                predicate: NSPredicate,
//                                completion: @escaping ([HKQuantitySample], HealthKitError?) -> Void)
}
