public enum TokenProperties: String, CaseIterable {
    case accessToken = "ACCESS-TOKEN"
    case expiresAt = "ACCESS-EXPIRES-AT"
    case userId = "USERID"
    case loginType = "LOGIN-TYPE"
    case oauth2Id = "OAUTH2ID"
    
    case userIdentifier = "USER-IDENTIFIER"
    case name = "NAME"
    case email = "EMAIL"
    case identityToken = "IDENTIFY-TOKEN"
    case authorizationCode = "AUTHORIZATION-CODE"
}

public protocol TokenStore {
    func validateToken() -> Bool
    func save(property: TokenProperties, value: String)
    func load(property: TokenProperties) -> String
    func delete(property: TokenProperties)
    func deleteAll()
}
