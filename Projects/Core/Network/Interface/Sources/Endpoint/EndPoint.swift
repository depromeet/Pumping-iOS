//
//  EndPoint.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation

public protocol Networkable: Requestable, Responsable { }

public struct Endpoint<R>: Networkable {
    public typealias Response = R
    
    public var path: String
    public var httpMethod: HTTPMethod
    public var queryParameters: Encodable?
    public var bodyParameters: Encodable?
    public var headers: [String : String]?
    
    public init(path: String,
                httpMethod: HTTPMethod,
                queryParameters: Encodable? = nil,
                bodyParameters : Encodable? = nil,
                headers: [String : String]? = nil
    ) {
        self.path = path
        self.httpMethod = httpMethod
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.headers = headers
    }
}
