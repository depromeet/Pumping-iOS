import HealthKit

public protocol HealthKitManagerInterface {
    func getQuantityTypeStatistics(identifier: HKQuantityTypeIdentifier,
                                   predicate: NSPredicate,
                                   completion: @escaping ((HKStatistics?, HealthKitError?) -> Void))
    
    func getQuantityTypeSamples(identifier: HKQuantityTypeIdentifier,
                                predicate: NSPredicate,
                                completion: @escaping ([HKQuantitySample], HealthKitError?) -> Void)
}
