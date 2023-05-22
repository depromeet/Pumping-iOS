//
//  WatchView.swift
//  AppWatchExtension
//
//  Created by Derrick kim on 2023/04/27.
//

import SwiftUI

struct WatchView: View {
    var body: some View {
        VStack {
            TabView {
                Text("The First Tab")
                  .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("First")
                  }
                Text("Another Tab")
                  .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Second")
                  }
            }
            
            Spacer()
            
            HStack {
                Button("Register") {}
                    .background(.blue)
             
                Spacer()
                
                Button("OK") {}
                    .background(.blue)
            }
            .buttonStyle(.plain)
        }
    }
}

struct WatchView_Previews: PreviewProvider {
    static var previews: some View {
        WatchView()
    }
}
