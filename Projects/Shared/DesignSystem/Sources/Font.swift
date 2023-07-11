//
//  Font.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/05/24.
//

import SwiftUI

public extension Font {
    /// 마이그레이션 예정 입니다.
    /// 기존의 pretendard, tenada 폰트 뿐 아니라 다양한 폰트를 적용할 수 있도록 코드를 작성
    /// Font.pumpingFont로 접근하여 사용가능함.
    /// ThenadaFont는 ViewModifier에서 사용할 예정으로 타입으로 만드는 것을 허용
    static func pretendard(size fontSize: CGFloat, type: FontType) -> Font {
        return .custom("\(type.name)", size: fontSize)
    }
    
    /// 마이그레이션 예정 입니다.
    /// 기존의 pretendard, tenada 폰트 뿐 아니라 다양한 폰트를 적용할 수 있도록 코드를 작성
    /// Font.pumpingFont로 접근하여 사용가능함.
    /// ThenadaFont는 ViewModifier에서 사용할 예정으로 타입으로 만드는 것을 허용
    static func tenada(size fontSize: CGFloat) -> Font {
        return .custom("Tenada", size: fontSize)
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
