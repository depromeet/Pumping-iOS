//
//  HomeView.swift
//  FeatureHomeInterface
//
//  Created by 송영모 on 2023/04/30.
//

import SwiftUI
import FeatureHomeInterface

public struct HomeView: HomeScreen {
    public init() {}
    
    public var body: some View {
        Text("Home")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
