//
//  PumpingFont.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/07/10.
//

import SwiftUI

public extension Font {
    /// Pumping 서비스의 Pretendard 폰트를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - size: Pumping 폰트 사이즈
    ///
    /// - Returns: Pumping의 Pretendard Font
    static func pretendard(size: Font.PumpingFontSize) -> Font {
        return pumpingFont(family: .pretendard, size: size)
    }
    
    /// Pumping 서비스의 Tenada 폰트를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - size: Pumping 폰트 사이즈
    ///
    /// - Returns: Pumping의 Tenada Font
    static func tenada(size: Font.PumpingFontSize) -> Font {
        return pumpingFont(family: .tenada, size: size)
    }
    
    /// Pumping 서비스의 Custom Font를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - family: Pumping 폰트 패밀리
    ///     - size: Pumping 폰트 사이즈
    ///
    /// - Returns: Pumping의 Custom Font
    static private func pumpingFont(
        family: Font.PumpingFontFamily = .pretendard,
        size: Font.PumpingFontSize) -> Font {
            let weight = pumpingFontWeight(family: family, size: size)
            let fileName = pumpingFontFileName(family: family, weight: weight)
            let width = size.width(family: family)
            
            return .custom(fileName, size: width)
    }
    
    /// Pumping 서비스의 Custom Font의 File Name를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - family: Pumping 폰트 패밀리
    ///     - weight: Pumping 폰트 무게
    ///
    /// - Returns: Pumping의 Custom Font의 FIle Name
    static private func pumpingFontFileName(family: Font.PumpingFontFamily, weight: Font.PumpingFontWeight) -> String {
        switch family {
        case .pretendard:
            switch weight {
            case .black: return "Pretendard-Black"
            case .bold: return "Pretendard-Bold"
            case .extraBold: return "Pretendard-ExtraBold"
            case .extraLight: return "Pretendard-ExtraLight"
            case .light: return "Pretendard-Light"
            case .medium: return "Pretendard-Medium"
            case .semiBold: return "Pretendard-SemiBold"
            case .thin: return "Pretendard-Thin"
            }
        case .tenada:
            return "Tenada"
        }
    }
    
    /// Pumping 서비스의 Custom Font의 Weight를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - family: Pumping 폰트 패밀리
    ///     - size: Pumping 폰트 사이즈
    ///
    /// - Returns: Pumping의 Custom Font의 Weight
    static private func pumpingFontWeight(family: Font.PumpingFontFamily, size: Font.PumpingFontSize) -> PumpingFontWeight {
        switch family {
        case .pretendard:
            switch size {
            case .h0, .h1, .h2, .h3, .h4, .h5:
                return .bold
                
            case .body1, .body2, .body3, .body4:
                return .medium
                
            case .caption1, .caption2:
                return .semiBold
            }
            
        case .tenada: return .extraBold
        }
    }
}

public extension Font {
    /// Pumping 서비스의 Font Weight 목록입니다.
    ///
    ///   - pretendard
    ///   - tenada
    enum PumpingFontFamily {
        case pretendard
        case tenada
    }
    
    /// Pumping 서비스의 Font Weight 목록입니다.
    ///
    ///   - black
    ///   - bold
    ///   - extraBold
    ///   - extraLight
    ///   - light
    ///   - medium
    ///   - semiBold
    ///   - thin
    enum PumpingFontWeight {
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case semiBold
        case thin
    }
    
    /// Pumping 서비스의 Font Size의 목록입니다.
    ///
    ///   - h0
    ///   - h1
    ///   - h2
    ///   - h3
    ///   - h4
    ///   - h5
    ///   - body1
    ///   - body2
    ///   - body3
    ///   - body4
    ///   - caption1
    ///   - caption2
    enum PumpingFontSize {
        case h0
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
        
        func width(family: PumpingFontFamily) -> CGFloat {
            switch family {
            case .pretendard:
                switch self {
                case .h0: return 56
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
            case .tenada:
                switch self {
                case .h0: return 56
                case .h1: return 36
                case .h2: return 32
                case .h3: return 28
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
}
