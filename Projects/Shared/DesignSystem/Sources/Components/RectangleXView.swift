//
//  RectangleXView.swift
//  SharedDesignSystem
//
//  Created by Derrick kim on 2023/06/08.
//

import SwiftUI

public struct RectangleXView: View {
    public init() { }

    public var body: some View {
        Rectangle()
            .frame(width: 287, height: 287)
            .foregroundColor(.colorGrey200)
            .overlay {
                Path { path in
                    let size = CGSize(width: 287, height: 287)
                    let center = CGPoint(x: 143.5, y: 143.5)
                    let topLeft = CGPoint(x: center.x - size.width / 2, y: center.y - size.height / 2)
                    let bottomRight = CGPoint(x: center.x + size.width / 2, y: center.y + size.height / 2)
                    path.move(to: topLeft)
                    path.addLine(to: bottomRight)
                    path.move(to: CGPoint(x: bottomRight.x, y: topLeft.y))
                    path.addLine(to: CGPoint(x: topLeft.x, y: bottomRight.y))
                }
                .stroke(Color.black, lineWidth: 2)
            }
    }
}
