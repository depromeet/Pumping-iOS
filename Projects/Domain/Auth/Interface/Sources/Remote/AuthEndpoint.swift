//
//  AuthEndpoint.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/06/20.
//

import Foundation

import Core

public struct AuthEndpoint {
    public static func signInWithApple(_ requestDTO: SignInWithAppleRequestDTO) -> Endpoint<SignInWithAppleResponseDTO> {
        return Endpoint(path: "oauth2/apple/login", httpMethod: .post, bodyParameters: requestDTO)
    }
    
    public static func signUp(_ requestDTO: SignUpRequestDTO) -> Endpoint<SignUpResponseDTO> {
        return Endpoint(path: "sign-up", httpMethod: .post, bodyParameters: requestDTO)
    }
}
