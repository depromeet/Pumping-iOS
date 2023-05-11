//
//  Requestable.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation
import CoreNetworkInterface

extension Requestable {
    private func makeURLComponents() throws -> URLComponents {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlRequestError(.makeURLError)
        }
        
        guard let urlComponents = URLComponents(string: baseURL + path) else {
            throw NetworkError.urlRequestError(.urlComponentError)
        }
        
        return urlComponents
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
    
    public func makeURLRequest() throws -> URLRequest {
        
        var urlComponent = try makeURLComponents()
        
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
        
        //MARK: Header Authorization 추가 Interceptor 대신
        //        urlRequest.setValue("Bearer ", forHTTPHeaderField: "Authorization")
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = httpMethod.rawValue
        
        return urlRequest
    }
}

// Shared의 Util 모듈로 이동?
extension Encodable {
    func toDictionary() throws -> [String : Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data)
        return jsonObject as? [String : Any]
    }
}
