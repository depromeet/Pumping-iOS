//
//  CharacterType.swift
//  DomainAuthInterface
//
//  Created by 박현우 on 2023/06/29.
//

import Foundation
import Shared
import SwiftUI

public enum CharacterType: String, CaseIterable {
    case a = "A"
    case b = "B"
    case c = "C"
    case d = "D"
    case e = "E"
    case f = "F"
    case g = "G"
    case h = "H"
    case i = "I"
    case j = "J"
    case k = "K"
    case l = "L"
    
    public func getCharacterImage(body: Bool = true, head: Bool = false) -> Image {
        switch self {
        case .a:
            if body {
                return PumpingImages.bodyA.swiftUIImage
            }
            return PumpingImages.headA.swiftUIImage
        case .b:
            if body {
                return PumpingImages.bodyB.swiftUIImage
            }
            return PumpingImages.headB.swiftUIImage
        case .c:
            if body {
                return PumpingImages.bodyC.swiftUIImage
            }
            return PumpingImages.headC.swiftUIImage
        case .d:
            if body {
                return PumpingImages.bodyD.swiftUIImage
            }
            return PumpingImages.headD.swiftUIImage
        case .e:
            if body {
                return PumpingImages.bodyE.swiftUIImage
            }
            return PumpingImages.headE.swiftUIImage
        case .f:
            if body {
                return PumpingImages.bodyF.swiftUIImage
            }
            return PumpingImages.headF.swiftUIImage
        case .g:
            if body {
                return PumpingImages.bodyG.swiftUIImage
            }
            return PumpingImages.headG.swiftUIImage
        case .h:
            if body {
                return PumpingImages.bodyH.swiftUIImage
            }
            return PumpingImages.headH.swiftUIImage
        case .i:
            if body {
                return PumpingImages.bodyI.swiftUIImage
            }
            return PumpingImages.headI.swiftUIImage
        case .j:
            if body {
                return PumpingImages.bodyJ.swiftUIImage
            }
            return PumpingImages.headJ.swiftUIImage
        case .k:
            if body {
                return PumpingImages.bodyK.swiftUIImage
            }
            return PumpingImages.headK.swiftUIImage
        case .l:
            if body {
                return PumpingImages.bodyL.swiftUIImage
            }
            return PumpingImages.headL.swiftUIImage
        }
    }
    
}
