//
//  AnimatableUsingView.swift
//  View_Practice01
//
//  Created by KyungHeon Lee on 10/28/25.
//  https://swiftwithmajid.com/2025/07/08/introducing-animatable-macro-in-swiftui/

import SwiftUI

@Animatable
struct IntegerView: View {
    var number: Float
    
    @AnimatableIgnored
    var ignoredValue: Float
    
    var body: some View {
        Text(number.formatted(.number.precision(.fractionLength(0))))
    }
}

struct AnimatableUsingView: View {
    @State private var number: Float = 0
    
    var body: some View {
        IntegerView(number: number, ignoredValue: 0)
            .animation(.default.speed(0.5), value: number)
        
        Button("Animate") {
            number = 100
        }
    }
} // AnimatableUsingView

#Preview {
    AnimatableUsingView()
}
