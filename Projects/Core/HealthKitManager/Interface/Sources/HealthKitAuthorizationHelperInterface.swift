//
//  HealthKitAuthorizationHelperInterface.swift
//  CoreHealthKitManagerInterface
//
//  Created by 박현우 on 2023/06/03.
//

import Foundation

public protocol HealthKitAuthorizationHelperInterface {
    func checkAuthorizationAndRequest(onSuccess : @escaping () -> Void, onFailure : @escaping () -> Void)
}
