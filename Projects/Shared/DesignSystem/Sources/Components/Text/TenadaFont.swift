//
//  TenadaFont.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/07/10.
//

import SwiftUI

public struct TenadaFont: ViewModifier {
    let size: Font.PumpingFontSize
    
    public init(size: Font.PumpingFontSize) {
        self.size = size
    }
    
    public func body(content: Content) -> some View {
        content
            .font(.tenada(size: size))
            .baselineOffset(-size.width(family: .tenada)/7)
    }
}
