//
//  ContentView.swift
//  RotationImage
//
//  Created by KyungHeon Lee on 2023/06/12.
//

import SwiftUI

struct ContentView: View {
    @State var angle: Double = 0.0
    @State var isAnimating = false
    
    var foreverAnimation: Animation {
        Animation.linear(duration: 2.0)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: "arrow.2.circlepath")
                .resizable()
                .frame(width: 200, height: 200)
                .rotationEffect(Angle(degrees: self.isAnimating ? 360.0 : 0.0))
                
                .animation(self.foreverAnimation)
                .onAppear {
                    self.isAnimating = true
                }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
