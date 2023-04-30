//
//  HomeView.swift
//  FeatureHome
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI
import FeatureMyPageInterface

public struct MyPageView: MyPageScreen {
    public init() {}
    
    public var body: some View {
        Text("MyPage")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
