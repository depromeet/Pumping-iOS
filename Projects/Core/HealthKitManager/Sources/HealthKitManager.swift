import Foundation
import HealthKit
import CoreHealthKitManagerInterface

public final class HealthKitManager : HealthKitManagerInterface {
    
    static public let shared = HealthKitManager()
    
    private let healthStore = HKHealthStore()
    
    private init() { }
    
   
}
