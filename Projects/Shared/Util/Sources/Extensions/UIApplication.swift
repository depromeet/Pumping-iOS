//
//  UIApplication.swift
//  SharedUtil
//
//  Created by 박현우 on 2023/06/08.
//

import Foundation
import UIKit

extension UIApplication {
    private func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    public func dismissAllSheet() {
        UIApplication.shared.connectedScenes.first?.inputViewController?.dismiss(animated: true)
    }
    
    public func addTapGestureRecognizer() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return
        }
        
        let tapGesture = UITapGestureRecognizer(target: window, action: #selector(UIView.endEditing(_:)))
        tapGesture.requiresExclusiveTouchType = false
        tapGesture.cancelsTouchesInView = false
        window.addGestureRecognizer(tapGesture)
    }
    
}
