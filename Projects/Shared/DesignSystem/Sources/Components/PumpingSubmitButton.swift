//
//  PumpingSubmitButton.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/06/01.
//

import SwiftUI

public struct PumpingSubmitButton: View {
    
    let title : String
    let isEnable : Bool
    let completion : () -> Void
    
    public init(title: String, isEnable: Bool = true, completion : @escaping () -> Void) {
        self.title = title
        self.isEnable = isEnable
        self.completion = completion
    }
    
    public var body: some View {
        Button {
            completion()
        } label: {
            buttonLabel()
        }
        .disabled(!isEnable)
    }
    
    private func buttonLabel() -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(isEnable ? Color.colorCyan300 : Color.colorGrey200)
            .frame(height: 56)
            .overlay {
                Text(title)
                    .font(.pretendard(size: 18, type: .semiBold))
                    .foregroundColor(isEnable ? .colorGrey900 : .colorGrey000)
                    .padding(EdgeInsets(top: 12, leading: 0, bottom: 12, trailing: 0))
            }
    }
}

struct PumpingSubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        PumpingSubmitButton(title: "계속하기", isEnable: false) {
            print("completion")
        }
    }
}
