//
//  BasicBottomSheet.swift
//  SharedDesignSystem
//
//  Created by 박현우 on 2023/06/19.
//

import SwiftUI

extension View {
    public func basicBottomSheet<Content: View>(isPresented: Binding<Bool>,
                                                detents: Set<PresentationDetent>,
                                                @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.modifier(
            BasicBottomSheetModifier(
                isPresented: isPresented,
                detents: detents
            ) {
                content()
            }
        )
    }
}


fileprivate struct BasicBottomSheetModifier<BottomSheetContent: View>: ViewModifier {
    
    var isPresented: Binding<Bool>
    let detents: Set<PresentationDetent>
    let bottomSheetContent: () -> BottomSheetContent
    
    func body(content: Content) -> some View {
        content
            .sheet(isPresented: isPresented) {
                bottomSheetContent()
                    .presentationDetents(detents)
                    .presentationDragIndicator(.hidden)
            }
    }
}


struct BasicBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
            .basicBottomSheet(isPresented: .constant(true), detents: [.medium]) {
                Text("hello")
            }
    }
}
