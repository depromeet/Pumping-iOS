//
//  Font.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/05/24.
//

import Foundation
import SwiftUI

public extension Font {
    
    enum FontType {
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case semiBold
        case thin
        
        var name : String {
            switch self {
            case .black:
                return "Pretendard-Black"
            case .bold:
                return "Pretendard-Bold"
            case .extraBold:
                return "Pretendard-ExtraBold"
            case .extraLight:
                return "Pretendard-ExtraLight"
            case .light:
                return "Pretendard-Light"
            case .medium:
                return "Pretendard-Medium"
            case .semiBold:
                return "Pretendard-SemiBold"
            case .thin:
                return "Pretendard-Thin"
            }
        }
    }
    
    static func pretendard(size fontSize: CGFloat, type: FontType) -> Font {
        return .custom("\(type.name)", size: fontSize)
    }

    static func tenada(size fontSize: CGFloat) -> Font {
        return .custom("Tenada", size: fontSize)
    }
}
