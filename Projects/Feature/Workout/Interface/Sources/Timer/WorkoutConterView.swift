//
//  WorkoutConterView.swift
//  FeatureWorkoutInterface
//
//  Created by 송영모 on 2023/06/06.
//

import SwiftUI

public struct WorkoutConterView: View {
    @Binding public  var count: Int
    
    public var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Text("\(count)")
                
                Spacer()
            }
            
            Spacer()
        }
    }
}
