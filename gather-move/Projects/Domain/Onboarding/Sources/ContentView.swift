//
//  ContentView.swift
//  Feature
//
//  Created by 송영모 on 2023/04/26.
//

import SwiftUI

public struct ContentView: View {
    public init() {}
    
    public var body: some View {
        TabView {
            Text("Another Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
