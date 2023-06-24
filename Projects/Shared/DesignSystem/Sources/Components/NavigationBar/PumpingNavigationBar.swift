//
//  NavigationLeadingButton.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/06/24.
//

import SwiftUI

struct PumpingNavigationBar: ViewModifier {
    
    let navigationTitle: String?
    let leadingButtonAction: (() -> Void)?
    let trailingButtonAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .navigationBarBackButtonHidden(true)
            .toolbar {
                if let leadingButtonAction {
                    navigationLeadingArea(action: leadingButtonAction)
                }
                
                if let navigationTitle {
                    navigationPrincipalArea(title: navigationTitle)
                }
                
                if let trailingButtonAction {
                    navigationTrailingArea(action: trailingButtonAction)
                }
            }
        
    }
    
    private func navigationLeadingArea(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button {
                action()
            } label: {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 8, height: 14)
                    .foregroundColor(.colorGrey900)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
        }
    }
    
    private func navigationPrincipalArea(title: String) -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(title)
                .font(.pretendard(size: 18, type: .semiBold))
                .foregroundColor(.colorGrey900)
        }
    }
    
    private func navigationTrailingArea(action: @escaping () -> Void) -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.colorGrey900)
                    .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            }
        }
    }
}

extension View {
    public func pumpingNavigationBar(
        title: String? = nil,
        leadingButtonAction: (() -> Void)? = nil,
        trailingButtonAction: (() -> Void)? = nil
        
    ) -> some View {
        self.modifier(
            PumpingNavigationBar(navigationTitle: title,
                                 leadingButtonAction: leadingButtonAction,
                                 trailingButtonAction: trailingButtonAction)
        )
    }
}
