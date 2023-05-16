public enum TokenProperties: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case expiresAt = "ACCESS-EXPIRES-AT"
}

public protocol TokenStore {
    func save(property: TokenProperties, value: String)
    func load(property: TokenProperties) -> String
    func delete(property: TokenProperties)
}
