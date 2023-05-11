//
//  NetworkProvider.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation

public protocol NetworkProviderInterface {
    func sendRequest<N: Networkable, T: Decodable>(_ endpoint: N) async throws -> T where N.Response == T
}
