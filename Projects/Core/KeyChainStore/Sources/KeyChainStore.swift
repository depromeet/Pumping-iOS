import Foundation
import CoreKeyChainStoreInterface

public final class KeyChainStore: TokenStore {
    public static let shared = KeyChainStore()
    
    public func save(property: TokenProperties, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: property.rawValue,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) ?? .init()
        ]
        
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }
    
    public func load(property: TokenProperties) -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: property.rawValue,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject?
        
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            guard let data = dataTypeRef as? Data else { return "" }
            return String(data: data, encoding: .utf8) ?? ""
        }
        
        return ""
    }
    
    public func delete(property: TokenProperties) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: property.rawValue
        ]
        
        SecItemDelete(query)
    }
}
