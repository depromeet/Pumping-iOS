import Foundation
import HealthKit
import CoreHealthKitManagerInterface

public final class HealthKitManager : HealthKitManagerInterface {
    
    static public let shared = HealthKitManager()
    
    private let healthStore = HKHealthStore()
    
    private init() { }
    
    public func getQuantityTypeStatistics(identifier: HKQuantityTypeIdentifier,
                                   predicate: NSPredicate,
                                   completion: @escaping ((HKStatistics?, HealthKitError?) -> Void)) {
        
        // Identifier로 Type 분류
        guard let quantityType = HKQuantityType.quantityType(forIdentifier: identifier) else {
            fatalError("""
                    Unexpected identifier \(identifier).
                    Please check if you have entered the correct identifier.
                """)
        }
        
        // Quantity Type과 날짜 Predicate로 query 작성,
        let query = HKStatisticsQuery(quantityType: quantityType,
                                      quantitySamplePredicate: predicate,
                                      options: .cumulativeSum) { _, result, error in
            if let error = error {
                completion(nil, HealthKitError.queryFailed(error: error))
            }
            
            /// 결과가 잘 들어왔는지 옵셔널 바인딩
            /// resulut : 순수 결과 데이터
            guard let result = result else {
                completion(nil, HealthKitError.dataNotFound)
                return
            }
            
            // escaping closure 내보내기
            completion(result, nil)
        }
        
        // HealthKit store에서 쿼리를 실행
        healthStore.execute(query)
    }
    
    public func getQuantityTypeSamples(identifier: HKQuantityTypeIdentifier,
                                predicate: NSPredicate,
                                completion: @escaping ([HKQuantitySample], HealthKitError?) -> Void) {
        
        // Identifier로 Type 분류
        guard let quantityType = HKObjectType.quantityType(forIdentifier: identifier) else {
            fatalError("""
                    Unexpected identifier \(identifier).
                    Please check if you have entered the correct identifier.
                """)
        }
        
        // 최신 데이터를 먼저 가져오도록 sort 기준 정의
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
        
        // 쿼리 수행 완료시 실행할 콜백 정의
        let query = HKSampleQuery(sampleType: quantityType,
                                  predicate: predicate,
                                  limit: HKObjectQueryNoLimit,
                                  sortDescriptors: [sortDescriptor]) { (_, samples, error) -> Void in
            if let error = error {
                // 에러 처리를 수행합니다.
                completion([], HealthKitError.queryFailed(error: error))
            }
            if let result = samples {
                
                // 결과가 비어있을 시 error throw
                if result.isEmpty {
                    completion([], HealthKitError.dataNotFound)
                }
                let quantitySamples = result.compactMap { $0 as? HKQuantitySample }
                completion(quantitySamples, nil)
            }
        }
        // HealthKit store에서 쿼리를 실행
        healthStore.execute(query)
    }
}
