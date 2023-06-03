//
//  PumpingButtonStyle.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/06/03.
//

import SwiftUI

public enum PumpingButtonStyle {
    case start
    case code
    case clue
    
    public var title: String {
        switch self {
        case .start: return "시작하기"
        case .code: return "코드로 참여"
        case .clue: return "크루 만들기"
        }
    }
}

public struct PumpingButtonTextStyleModifier: ViewModifier {
    public let style: PumpingButtonStyle
    
    public init(style: PumpingButtonStyle) {
        self.style = style
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.pretendard(size: 18, type: .bold))
            .foregroundColor(.colorGrey000)
            .frame(maxWidth: .infinity)
            .frame(height: 52)
    }
}

public struct PumpingButtonStyleModifier: ViewModifier {
    public let style: PumpingButtonStyle
    
    public init(style: PumpingButtonStyle) {
        self.style = style
    }
    
    public func body(content: Content) -> some View {
        content
            .background(Color.colorCyan300)
            .cornerRadius(12)
            .padding(.horizontal)
            .padding(.bottom, 34)
    }
}
