//
//  PumpingWheelPicker.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/06/04.
//

import SwiftUI

public enum PickerUnit : String {
    case height = "cm"
    case weight = "kg"
    case date = "일"
    case people = "명"
    case count = "회"
}

public struct PumpingWheelPicker: View {
    @State private var showPicker : Bool = false
    
    private var titleText : String?
    private var value: Binding<Int>
    private var pickerUnit : PickerUnit
    
    public init(value: Binding<Int>, pickerUnit : PickerUnit) {
        self.value = value
        self.pickerUnit = pickerUnit
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let titleText {
                Text(titleText)
                    .font(.pretendard(size: 16, type: .bold))
                    .foregroundColor(.colorGrey800)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            pickerView()
        }
        .sheet(isPresented: $showPicker) {
            Picker("", selection: value) {
                switch pickerUnit {
                case .height:
                    ForEach(140..<201) { Text("\($0)\(pickerUnit.rawValue)").tag($0) }
                case .weight:
                    ForEach(40..<121) { Text("\($0)\(pickerUnit.rawValue)").tag($0) }
                case .date:
                    ForEach(1..<8) { Text("\($0)\(pickerUnit.rawValue)").tag($0) }
                case .people:
                    ForEach(2..<6) { Text("\($0)\(pickerUnit.rawValue)").tag($0) }
                case .count:
                    ForEach(1..<8) { Text("\($0)\(pickerUnit.rawValue)").tag($0) }
                }
            }
            .labelsHidden()
            .pickerStyle(WheelPickerStyle())
            .presentationDetents([.height(200)])
        }
    }
    
    private func pickerView() -> some View {
        Button {
            showPicker = true
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.colorGrey500, lineWidth : 1)
                .frame(height: 50)
                .overlay {
                    HStack {
                        if value.wrappedValue != 0 {
                            Text("\(value.wrappedValue)\(pickerUnit.rawValue)")
                                .font(.pretendard(size: 15, type: .medium))
                                .foregroundColor(.colorGrey000)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.colorGrey300)
                    }
                    .padding(.horizontal)
                }
        }
    }
}

extension PumpingWheelPicker {
    public func setTitleText(_ titleText: String) -> Self {
        var copy = self
        copy.titleText = titleText
        return copy
    }
}
