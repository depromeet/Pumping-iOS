//
//  Responsable.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation

public struct EmptyData : Decodable { }


public protocol Responsable {
    associatedtype Response
}
