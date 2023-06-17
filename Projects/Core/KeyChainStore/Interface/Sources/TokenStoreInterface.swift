public enum TokenProperties: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case expiresAt = "ACCESS-EXPIRES-AT"
    
    case userIdentifier = "USER-IDENTIFIER"
    case name = "NAME"
    case email = "EMAIL"
    case identityToken = "IDENTIFY-TOKEN"
    case authorizationCode = "AUTHORIZATION-CODE"
}

public protocol TokenStore {
    func save(property: TokenProperties, value: String)
    func load(property: TokenProperties) -> String
    func delete(property: TokenProperties)
}
