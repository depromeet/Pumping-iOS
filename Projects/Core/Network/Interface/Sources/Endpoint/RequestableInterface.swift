//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation

public protocol Requestable {
    var path: String { get }
    var httpMethod : HTTPMethod { get }
    var queryParameters: Encodable? { get }
    var bodyParameters: Encodable? { get }
}
