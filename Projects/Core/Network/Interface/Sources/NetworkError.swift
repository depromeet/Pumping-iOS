//
//  NetworkError.swift
//  CoreNetwork
//
//  Created by 박현우 on 2023/05/10.
//

import Foundation

public enum NetworkError: Error, Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        return lhs.errorMessage == rhs.errorMessage
    }
    
    case urlRequestError(URLRequestError)
    case decodingError
    case invalidURLError
    case noResponseError
    case serverError
    case badRequestError
    case authorizationError
    case internetConnectionError
    case unknownError
    
    var errorMessage: String {
        switch self {
        case let .urlRequestError(urlRequestError):
              return urlRequestError.errorMessage
        case .decodingError :
            return "Decoding Error"
        case .invalidURLError :
            return "Invalid URL"
        case .noResponseError :
            return "No Response"
        case .serverError :
            return "Server Error"
        case .authorizationError :
            return "Authorization Error"
        case .badRequestError :
            return "Bad Request From Client"
        case .internetConnectionError :
            return "Internet Connection is unstable"
        case .unknownError :
            return "Unknown Error"
        }
    }
    
    public enum URLRequestError: Error {
        case urlComponentError
        case queryEncodingError
        case bodyEncodingError
        case makeURLError
        
        var errorMessage: String {
            switch self {
            case .urlComponentError:
                return "urlComponentError"
            case .queryEncodingError:
                return "queryEncodingError"
            case .bodyEncodingError:
                return "queryEncodingError"
            case .makeURLError:
                return "makeURLError"
            }
        }
    }
}
