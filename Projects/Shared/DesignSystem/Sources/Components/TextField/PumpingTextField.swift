//
//  PumpingTextField.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/06/03.
//

import SwiftUI

public struct PumpingTextField: View {
    
    @FocusState private var isFocused : Bool
    private var text: Binding<String>
    private var titleText: String?
    private var placeHolderText: String = ""
    private var errorText : String?
    private var maxCount: Int
    
    //Text Color
    private var defaultTextColor = Color.colorGrey800
    //Title Color
    private var defaultTitleColor = Color.colorGrey800
    //PlaceHolder Text Color
    private var defaultPlaceHolderTextColor = Color.colorGrey500
    //Background Color
    private var defaultBackgroundColor = Color.colorGreen50
    //Border Color
    private var defaultBorderColor = Color.colorGrey500
    //Focused Border Color
    private var focusedBorderColor = Color.colorGrey900
    
    public init(text: Binding<String>, maxCount: Int = 15) {
        self.text = text
        self.maxCount = maxCount
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(spacing: 12) {
                if let titleText {
                    Text(titleText)
                        .font(.pretendard(size: 16, type: .bold))
                        .foregroundColor(.colorGrey800)
                }
                
                if let errorText, text.wrappedValue.count > maxCount {
                    Text(errorText)
                        .font(.pretendard(size: 13, type: .medium))
                        .foregroundColor(.red)
                }
            }
            
            ZStack(alignment: .trailing) {
                VStack(spacing: 0){
                    HStack(spacing: 0){
                        TextField("", text : text)
                            .placeholder(
                                when: text.wrappedValue.isEmpty,
                                placeholder: {
                                    Text(placeHolderText)
                                        .foregroundColor(.colorGrey500)
                                        .font(.pretendard(size: 15, type: .medium))
                                }
                            )
                            .focused($isFocused)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .foregroundColor(.colorGrey800)
                            .padding(.horizontal, 20)
                            .padding(.trailing, 40)
//                           텍스트가 maxCount이상 입력되는것을 방지하기 위한 코드 (Ex. maxCount가 15일경우 15자 까지만 입력되고 이후의 입력값은 무시함)
//                            .onReceive(text.wrappedValue.publisher.collect()) {
//                                let value = String($0.prefix(maxCount))
//                                if text.wrappedValue != value && (maxCount != 0){
//                                    text.wrappedValue = value
//                                }
//                            }
                            .background(Color.clear)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(getBorderColor(), lineWidth: 1)
                    )
                }
                
                Group {
                    if isFocused {
                        Button {
                            self.text.wrappedValue = ""
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.colorGrey300)
                                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                        }
                    } else {
                        Text("\(text.wrappedValue.count)/\(maxCount)")
                            .font(.pretendard(size: 15, type: .medium))
                            .foregroundColor(text.wrappedValue.count > maxCount ? .red : .colorGrey500)
                    }
                }
                .padding(.trailing)
                
                
            }
        }
        
    }
    
}
extension PumpingTextField {
    
    public func setTitleText(_ titleText: String) -> Self {
        var copy = self
        copy.titleText = titleText
        return copy
    }
    
    public func setPlaceHolderText(_ placeHolderText: String) -> Self {
        var copy = self
        copy.placeHolderText = placeHolderText
        return copy
    }
    
    public func setErrorText(_ errorText: String) -> Self {
        var copy = self
        copy.errorText = errorText
        return copy
    }
    
    public func setMaxCount(_ count: Int) -> Self {
        var copy = self
        copy.maxCount = count
        return copy
    }
    
    private func getBorderColor() -> Color {
        if maxCount < text.wrappedValue.count {
            return Color.red
        }
        
        if isFocused {
            return focusedBorderColor
        } else {
            return defaultBorderColor
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder()
                    .opacity(shouldShow ? 1 : 0)
                
                self
            }
        }
}

struct PumpingTextField_Previews: PreviewProvider {
    static var previews: some View {
        PumpingTextField(text: .constant(""))
    }
}
