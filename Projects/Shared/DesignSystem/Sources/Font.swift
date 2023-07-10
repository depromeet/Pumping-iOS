//
//  Font.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/05/24.
//

import SwiftUI

public extension Font {
    static func pretendard(type fontSizeType: FontSizeType) -> Font {
        return .pretendard(size: fontSizeType.size, type: fontSizeType.fontType)
    }
    
    static func pretendard(size fontSize: CGFloat, type: FontType) -> Font {
        return .custom("\(type.name)", size: fontSize)
    }

    static func tenada(size fontSize: CGFloat) -> Font {
        return .custom("Tenada", size: fontSize)
    }
}

public extension Font {
    enum FontSizeType {
        case h1
        case h2
        case h3
        case h4
        case h5
        case body1
        case body2
        case body3
        case body4
        case caption1
        case caption2
        
        var fontType: FontType {
            switch self {
            case .h1, .h2, .h3, .h4, .h5, .caption1, .caption2: return .semiBold
            case .body1, .body2, .body3, .body4: return .medium
            }
        }
        
        var size: CGFloat {
            switch self {
            case .h1: return 32
            case .h2: return 24
            case .h3: return 21
            case .h4: return 18
            case .h5: return 16
            case .body1: return 15
            case .body2: return 14
            case .body3: return 13
            case .body4: return 12
            case .caption1: return 11
            case .caption2: return 10
            }
        }
    }
}

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
}
