//
//  NetworkProvider.swift
//  NetworkInterface
//
//  Created by 송영모 on 2023/04/26.
//

import Foundation
import CoreNetworkInterface
import SharedUtil

public final class NetworkProvider : NetworkProviderInterface {
    public static let shared = NetworkProvider()
    
    public func sendRequest<N: Networkable, T: Decodable>(_ endpoint: N, isBypass: Bool = false) async throws -> T where N.Response == T {
        do {
            let urlRequest: URLRequest = try endpoint.makeURLRequest(isBypass: isBypass)
            let (data, response) = try await URLSession.shared.data(for: urlRequest, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError.noResponseError
            }
            
            print(urlRequest)
            
            if let requestBodyJsonString = String(data: urlRequest.httpBody ?? .SubSequence(), encoding: .utf8) {
                print(requestBodyJsonString)
            }
            
            if let responseJsonString = String(data: data, encoding: .utf8) {
                print(responseJsonString)
            }
            
            if let emptyResponse = try JSONDecoder().decode(EmptyData.self, from: data) as? T, data.isEmpty {
                return emptyResponse
            }
            print(response.statusCode)
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                    throw NetworkError.decodingError
                }
                return decodedResponse
            case 401 :
                throw NetworkError.authorizationError
            case 400...499:
                throw NetworkError.badRequestError
            case 500...599 :
                throw NetworkError.serverError
            default:
                throw NetworkError.unknownError
            }
            
        } catch URLError.Code.notConnectedToInternet {
            throw NetworkError.internetConnectionError
        }
    }
    
}
