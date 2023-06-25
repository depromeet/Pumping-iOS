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


public typealias AccessRequestCallback = (Bool, Error?) -> Void

/// Helper for reading and writing to HealthKit.
//public class HealthKitManager1 {
//    public static let shared = HealthKitManager()
//
//    private let healthStore = HKHealthStore()
//    private let kUserDefaultsAnchorKey = "Anchor"
//
//    public func setting() {
//        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//            fatalError("*** Unable to get the step count type ***")
//        }
//
//        healthStore.requestAuthorization(toShare: [heartRateType], read: [heartRateType]) { [weak self] (success, error) in
//            self?.healthStore.enableBackgroundDelivery(for: heartRateType, frequency: .immediate) { (success: Bool, error: Error?) in
//                debugPrint("background observing - success: \(success)")
//            }
//        }
//    }
//
//    public func observe() {
//        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//            fatalError("*** Unable to get the step count type ***")
//        }
//
//        let observerQuery = HKObserverQuery(sampleType: heartRateType, predicate: nil) { [weak self] (query, completion, error) in
//            debugPrint("변경이 감지되었습니다. \(error)")
//            self?.anchor()
//            completion()
//        }
//
//        healthStore.execute(observerQuery)
//    }
//
//    public func realtime() {
//        let devicePredicate = HKQuery.predicateForObjects(from: [HKDevice.local()])
//
//        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = {
//            query, samples, deletedObjects, queryAnchor, error in
//
//         // A sample that represents a quantity, including the value and the units.
//        guard let samples = samples as? [HKQuantitySample] else {
//            return
//        }
//
//            self.process(samples, type: .heartRate)
//
//        }
//
//        // It provides us with both the ability to receive a snapshot of data, and then on subsequent calls, a snapshot of what has changed.
//        let query = HKAnchoredObjectQuery(type: HKObjectType.quantityType(forIdentifier: .heartRate)!, predicate: nil, anchor: nil, limit: HKObjectQueryNoLimit, resultsHandler: updateHandler)
//
//        query.updateHandler = updateHandler
//
//        // query execution
//
//        healthStore.execute(query)
//    }
//
//    private func process(_ samples: [HKQuantitySample], type: HKQuantityTypeIdentifier) {
//            // variable initialization
//            var lastHeartRate = 0.0
//
//            // cycle and value assignment
//            for sample in samples {
////                if type == .heartRate {
////                    lastHeartRate = sample.quantity.doubleValue(for: HKUnit(from: "count/min"))
////                }
////
////                debugPrint(lastHeartRate)
//                print("심박수: \(sample.quantity.doubleValue(for: HKUnit(from: "count/min")))")
//                print("시작 시간: \(sample.startDate)")
//                print("종료 시간: \(sample.endDate)")
//            }
//        }
//
//    public func predicate() {
//        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//            fatalError("*** Unable to get the step count type ***")
//        }
//
//        let predicate = HKQuery.predicateForSamples(withStart: nil, end: Date(), options: .strictEndDate)
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
//
//        let sampleQuery = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
//            if let error = error {
//                // 데이터 가져오기 중에 오류가 발생한 경우 처리할 내용
//                print("오류: \(error.localizedDescription)")
//                return
//            }
//
//            guard let sample = samples?.last as? HKQuantitySample else {
//                // 심박수 데이터를 가져올 수 없을 때 처리할 내용
//                return
//            }
//
//            // 가져온 심박수 데이터 처리
//            print("심박수: \(sample.quantity.doubleValue(for: HKUnit(from: "count/min")))")
//            print("시작 시간: \(sample.startDate)")
//            print("종료 시간: \(sample.endDate)")
//        }
//
//        healthStore.execute(sampleQuery)
//    }
//
//    public func sample() {
//        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//            fatalError("*** Unable to get the step count type ***")
//        }
//
//        let sampleQuery = HKSampleQuery(
//                sampleType: heartRateType,
//                predicate: nil,
//                limit: HKObjectQueryNoLimit,
//                sortDescriptors: nil,
//                resultsHandler: { [weak self] (query, samples, error) in
//                    debugPrint(samples?.last)
//            })
//
//        healthStore.execute(sampleQuery)
//    }
//
//    public func anchor() {
//        guard let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate) else {
//            fatalError("*** Unable to get the step count type ***")
//        }
//
//        var previousAnchor = self.retrieveAnchor()
//
//        debugPrint(previousAnchor)
//
//        let updateHandler: (HKAnchoredObjectQuery, [HKSample]?, [HKDeletedObject]?, HKQueryAnchor?, Error?) -> Void = { [weak self] (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
//            guard let samples = samplesOrNil, let sample = samples.last as? HKQuantitySample else {
//                return
//            }
//            print("심박수: \(sample.quantity.doubleValue(for: HKUnit(from: "count/min")))")
//            print("시작 시간: \(sample.startDate)")
//            print("종료 시간: \(sample.endDate)")
//            previousAnchor = newAnchor
//            self?.storeAnchor(anchor: newAnchor)
//        }
//
//        let anchoredQuery = HKAnchoredObjectQuery(
//            type: heartRateType,
//            predicate: nil,
//            anchor: nil,
//            limit: HKObjectQueryNoLimit,
//            resultsHandler: updateHandler)
////        ) { [weak self] (query, samplesOrNil, deletedObjectsOrNil, newAnchor, errorOrNil) in
////            guard let samples = samplesOrNil, let tmp = samples.last as? HKQuantitySample else {
////                return
////            }
////
////            debugPrint("query: \(query)")
//////            debugPrint("samples.last: \(samplesOrNil)")
//////            debugPrint("bpm: \(tmp.quantity.doubleValue(for: HKUnit(from: "count/min"))")
////            debugPrint("prevAnchor: \(previousAnchor)")
////            debugPrint("newAnchor: \(newAnchor)")
////            debugPrint("errorOrNil: \(errorOrNil)")
//////            802896
//////            802907
////
////            previousAnchor = newAnchor
////            self?.storeAnchor(anchor: newAnchor)
////
////            DispatchQueue.main.async {
////                // Update the UI here.
////            }
////        }
////
////        anchoredQuery.updateHandler =
//
//        healthStore.execute(anchoredQuery)
//    }
//
//    func storeAnchor(anchor: HKQueryAnchor?) {
//        guard let anchor = anchor else { return }
//        do {
//            let data = try NSKeyedArchiver.archivedData(withRootObject: anchor, requiringSecureCoding: true)
//            UserDefaults.standard.set(data, forKey: kUserDefaultsAnchorKey)
//        } catch {
//            debugPrint("Unable to store new anchor")
//        }
//    }
//
//    func retrieveAnchor() -> HKQueryAnchor? {
//        guard let data = UserDefaults.standard.data(forKey: kUserDefaultsAnchorKey) else { return nil }
//        do {
//            return try NSKeyedUnarchiver.unarchivedObject(ofClass: HKQueryAnchor.self, from: data)
//        } catch {
//            debugPrint("Unable to retrieve an anchor")
//            return nil
//        }
//    }
//
//    /// Requests access to all the data types the app wishes to read/write from HealthKit.
//    /// On success, data is queried immediately and observer queries are set up for background
//    /// delivery. This is safe to call repeatedly and should be called at least once per launch.
//    public func requestAccessWithCompletion(completion: @escaping AccessRequestCallback) {
//        guard deviceSupportsHealthKit() else {
//            debugPrint("HealthKit is not supported on this device. (or tests are running)")
//            return
//        }
//
//        let writeDataTypes = dataTypesToWrite()
//        let readDataTypes = dataTypesToRead()
//
//        healthStore.requestAuthorization(toShare: writeDataTypes, read: readDataTypes) { [weak self] (success: Bool, error: Error?) in
//            guard let strongSelf = self else { return }
//            if success {
//                debugPrint("Access to HealthKit data has been granted")
//                strongSelf.readHealthKitData()
//                strongSelf.setUpBackgroundDeliveryForDataTypes(types: readDataTypes)
//            } else {
//                debugPrint("Error requesting HealthKit authorization: \(error)")
//            }
//
//            completion(success, error)
//        }
//    }
//}
//
//// MARK: - Private
//private extension HealthKitManager {
//    /// Determines whether the device supports HealthKit. HealthKit is not supported while running unit tests (XCTestCase)
//    ///
//    /// - returns: true if device and current OS support HealthKit; false otherwise.
//    private func deviceSupportsHealthKit() -> Bool {
//        return HKHealthStore.isHealthDataAvailable() && NSClassFromString("XCTestCase") == nil
//    }
//
//    /// Initiates an `HKAnchoredObjectQuery` for each type of data that the app reads and stores
//    /// the result as well as the new anchor.
//    public func readHealthKitData() {
//        for type in dataTypesToRead() {
//            readHealthKitData(type: type)
//        }
//    }
//
//    /// Sets up the observer queries for background health data delivery.
//    ///
//    /// - parameter types: Set of `HKSampleType` to observe changes to.
//    private func setUpBackgroundDeliveryForDataTypes(types: Set<HKSampleType>) {
//        for type in types {
//            let query = HKObserverQuery(sampleType: type, predicate: nil) { [weak self] (query: HKObserverQuery, completionHandler: HKObserverQueryCompletionHandler, error: Error?) in
//                debugPrint("observer query update handler called for type \(type), error: \(error)")
//                guard let strongSelf = self else { return }
//                strongSelf.queryForUpdates(type: type)
//                strongSelf.bodyMassObserverQueryTriggered()
//                completionHandler()
//            }
//            healthStore.execute(query)
//            healthStore.enableBackgroundDelivery(for: type, frequency: .immediate) { (success: Bool, error: Error?) in
//                debugPrint("enableBackgroundDeliveryForType handler called for \(type) - success: \(success), error: \(error)")
//            }
//        }
//    }
//
//    public func bodyMassObserverQueryTriggered() {
//        debugPrint("HI")
//        let bodyMassSampleQuery = HKSampleQuery(
//            sampleType: HKQuantityType.init(.heartRate),
//                predicate: nil,
//                limit: HKObjectQueryNoLimit,
//                sortDescriptors: nil,
//                resultsHandler: { [weak self] (query, samples, error) in
//                    guard let currData:HKQuantitySample = samples?.last as? HKQuantitySample else { return }
//                    debugPrint("HI 1")
//                    debugPrint(currData.quantity.doubleValue(for: HKUnit(from: "count/min")))
////                    self?.bodyMassSampleQueryFinished(samples: samples)
//            })
//        healthStore.execute(bodyMassSampleQuery)
//    }
//
//    /// Initiates HK queries for new data based on the given type
//    ///
//    /// - parameter type: `HKObjectType` which has new data avilable.
//    private func queryForUpdates(type: HKObjectType) {
//        switch type {
//        case HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!:
//            debugPrint("HKQuantityTypeIdentifierBodyMass")
//        case HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!:
//            debugPrint("HKQuantityTypeIdentifierHeight")
//        case HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!:
//            debugPrint("HKQuantityTypeIdentifierHeight")
//        case HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!:
//            debugPrint("heartRate")
//        case HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRateVariabilitySDNN)!:
//            debugPrint("heartRateVariabilitySDNN")
//        case is HKWorkoutType:
//            debugPrint("HKWorkoutType")
//        default: debugPrint("Unhandled HKObjectType: \(type)")
//        }
//    }
//
//    /// Types of data that this app wishes to read from HealthKit.
//    ///
//    /// - returns: A set of HKSampleType.
//    private func dataTypesToRead() -> Set<HKSampleType> {
//        return Set(arrayLiteral:
//                    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRateVariabilitySDNN)!,
//            HKObjectType.workoutType()
//        )
//    }
//
//    /// Types of data that this app wishes to write to HealthKit.
//    ///
//    /// - returns: A set of HKSampleType.
//    private func dataTypesToWrite() -> Set<HKSampleType> {
//        return Set(arrayLiteral:
//                    HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.bodyMass)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.height)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
//                   HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRateVariabilitySDNN)!,
//            HKObjectType.workoutType()
//        )
//    }
//}
//
//// MARK: - Queries
//private extension HealthKitManager {
//    public func readHealthKitData(type: HKSampleType) {
//        let typeName = type.identifier
//        let anchorKey = typeName + "QueryAnchor"
//        let anchor = UserDefaults.standard.integer(forKey: anchorKey)
//
//        // Deprecated iOS 8 API
//        // Specifying no limit because otherwise we only get the oldest record
//        let query = HKAnchoredObjectQuery(type: type, predicate: nil, anchor: anchor, limit: Int(HKObjectQueryNoLimit)) {
//            (query: HKAnchoredObjectQuery, samples: [HKSample]?, newAnchor: Int, error: Error?) in
//
//            guard let samples = samples as? [HKQuantitySample] else {
//                debugPrint("Unable to query HealthKit for \(typeName) sample: \(error?.localizedDescription)")
//                return
//            }
//
//            guard samples.count > 0, let _ = samples.last else {
//                debugPrint("HealthKit \(typeName) query successful, but returned empty results")
//                return
//            }
//
//            debugPrint("HealthKit data \(type), \(newAnchor),  \(anchorKey)")
//            UserDefaults.standard.set(newAnchor, forKey: anchorKey)
//
////            let value = sample.quantity.doubleValueForUnit(heightUnit.hkunit)
////            debugPrint("Sample retrieved from HealthKit: \(value), \(heightUnitString) (source: \(sample.source))")
//        }
//
//        let nquery = HKSampleQuery(
//                sampleType: HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)!,
//                predicate: nil,
//                limit: HKObjectQueryNoLimit,
//                sortDescriptors: nil,
//                resultsHandler: { [weak self] (query, samples, error) in
////                    if let entity = samples?.last as HK {
////                        print("\(query), \(samples?.last?.sampleType), \(error)")
////                    }
//                })
////        hkStore.execute(bodyMassSampleQuery!)
//
//        healthStore.execute(nquery)
//    }
//}
