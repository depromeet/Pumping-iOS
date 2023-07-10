//
//  TenadaFont.swift
//  SharedDesignSystem
//
//  Created by 송영모 on 2023/07/10.
//

import SwiftUI

struct TenadaFont: ViewModifier {
    let sizeType: Font.FontSizeType
    
    public init(type fontSizeType: Font.FontSizeType) {
        self.sizeType = fontSizeType
    }
    
    func body(content: Content) -> some View {
        content
            .font(.tenada(size: sizeType.size))
    }
}


