//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation
import CoreNetworkInterface
import SharedUtil

extension Requestable {
    private func makeURLComponents(isBypass: Bool) throws -> URLComponents? {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlRequestError(.makeURLError)
        }
        
        guard let prefix = Bundle.main.infoDictionary?["BASE_URL_PREFIX"] as? String else {
            throw NetworkError.urlRequestError(.makeURLError)
        }
        
        guard let bypassPrefix = Bundle.main.infoDictionary?["BASE_URL_BYPASS_PREFIX"] as? String else {
            throw NetworkError.urlRequestError(.makeURLError)
        }
        
        return isBypass ? URLComponents(string: baseURL + bypassPrefix + path) : URLComponents(string: baseURL + prefix + path)
    }
    
    private func getQueryParameters() throws -> [URLQueryItem]? {
        guard let queryParameters else {
            return nil
        }
        
        guard let queryDictionary = try? queryParameters.toDictionary() else {
            throw NetworkError.urlRequestError(.queryEncodingError)
        }
        
        var queryItemList : [URLQueryItem] = []
        
        queryDictionary.forEach { (key, value) in
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            queryItemList.append(queryItem)
        }
        
        if queryItemList.isEmpty {
            return nil
        }
        
        return queryItemList
    }
    
    private func getBodyParameters() throws -> Data? {
        guard let bodyParameters else {
            return nil
        }
        
        guard let bodyDictionary = try? bodyParameters.toDictionary() else {
            throw NetworkError.urlRequestError(.bodyEncodingError)
        }
        
        guard let encodedBody = try? JSONSerialization.data(withJSONObject: bodyDictionary) else {
            throw NetworkError.urlRequestError(.bodyEncodingError)
        }
        
        return encodedBody
    }
    
    public func makeURLRequest(isBypass: Bool) throws -> URLRequest {
        guard var urlComponent = try makeURLComponents(isBypass: isBypass) else {
            throw NetworkError.urlRequestError(.urlComponentError)
        }
        
        if let queryItems = try getQueryParameters() {
            urlComponent.queryItems = queryItems
        }
        
        guard let url = urlComponent.url else {
            throw NetworkError.invalidURLError
        }
        
        var urlRequest = URLRequest(url: url)
        
        if let httpBody = try getBodyParameters() {
            urlRequest.httpBody = httpBody
        }
        
        if let headers {
            headers.forEach { key, value in
                urlRequest.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod.rawValue
        
        return urlRequest
    }
}
