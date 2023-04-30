//
//  TabBarView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/30.
//

import SwiftUI
import FeatureHome
import FeatureMyPage

public struct TabBarView: View {
    public init() {}
    
    public var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Second")
                }
            MyPageView()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
