//
//  PumpingFont.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/07/10.
//

import SwiftUI

public extension Font {
    /// Pumping 서비스의 Custom Font를 반환하는 함수 입니다.
    ///
    /// - Parameters:
    ///     - size: Pumping 폰트의 사이즈 타입
    ///
    /// - Returns: Pumping의 Custom Font
    static func pumpingFont(size: Font.PumpingFontSize) -> Font {
        return .custom(size.weight.fileName, size: size.size)
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
        case black(PumpingFontFamily)
        case bold(PumpingFontFamily)
        case extraBold(PumpingFontFamily)
        case extraLight(PumpingFontFamily)
        case light(PumpingFontFamily)
        case medium(PumpingFontFamily)
        case semiBold(PumpingFontFamily)
        case thin(PumpingFontFamily)
        
        ///   각 폰트 패밀리의 파일 네임을 가져옵니다.
        var fileName: String {
            switch self {
                // pretendard
            case .black(.pretendard): return "Pretendard-Black"
            case .bold(.pretendard): return "Pretendard-Bold"
            case .extraBold(.pretendard): return "Pretendard-ExtraBold"
            case .extraLight(.pretendard): return "Pretendard-ExtraLight"
            case .light(.pretendard): return "Pretendard-Light"
            case .medium(.pretendard): return "Pretendard-Medium"
            case .semiBold(.pretendard): return "Pretendard-SemiBold"
            case .thin(.pretendard): return "Pretendard-Thin"
                
                // thenada
            case .black(.tenada): return "Tenada"
            case .bold(.tenada): return "Tenada"
            case .extraBold(.tenada): return "Tenada"
            case .extraLight(.tenada): return "Tenada"
            case .light(.tenada): return "Tenada"
            case .medium(.tenada): return "Tenada"
            case .semiBold(.tenada): return "Tenada"
            case .thin(.tenada): return "Tenada"
            }
        }
    }
    
    /// Pumping 서비스의 Font Size의 목록입니다.
    ///
    ///   - h0: tenada 폰트에만 적용합니다.
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
        case h0(PumpingFontFamily)
        case h1(PumpingFontFamily)
        case h2(PumpingFontFamily)
        case h3(PumpingFontFamily)
        case h4(PumpingFontFamily)
        case h5(PumpingFontFamily)
        case body1(PumpingFontFamily)
        case body2(PumpingFontFamily)
        case body3(PumpingFontFamily)
        case body4(PumpingFontFamily)
        case caption1(PumpingFontFamily)
        case caption2(PumpingFontFamily)
        
        var weight: Font.PumpingFontWeight {
            switch self {
                //extraBold
            case .h0(_), .h1(.tenada), .h2(.tenada), .h3(.tenada), .h4(.tenada), .h5(.tenada), .body1(.tenada), .body2(.tenada), .body3(.tenada), .body4(.tenada), .caption1(.tenada), .caption2(.tenada):
                return .extraBold(.tenada)
                
                //semiBold
            case .h1(.pretendard), .h2(.pretendard), .h3(.pretendard), .h4(.pretendard), .h5(.pretendard), .caption1(.pretendard), .caption2(.pretendard):
                return .semiBold(.pretendard)
                
                //medium
            case .body1(.pretendard), .body2(.pretendard), .body3(.pretendard), .body4(.pretendard):
                return .medium(.pretendard)
            }
        }
        
        var size: CGFloat {
            switch self {
                // pretendard
            case .h1(.pretendard): return 32
            case .h2(.pretendard): return 24
            case .h3(.pretendard): return 21
            case .h4(.pretendard): return 18
                
                // thenada
            case .h1(.tenada): return 36
            case .h2(.tenada): return 32
            case .h3(.tenada): return 28
            case .h4(.tenada): return 18
                
                // default
            case .h0: return 56
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
