//
//  TabbView.swift
//  View_Practice01
//
//  Created by KyungHeon Lee on 11/5/25.
//

import SwiftUI

struct TabbView: View {

    var body: some View {
        TabView {
            Tab("Menu", systemImage: "sailboat") {
                MenuView()
            }
            
            Tab("Flavor", systemImage: "sailboat") {
                FlavorView()
            }
            
            Tab("Animatable", systemImage: "sailboat") {
                AnimatableUsingView()
            }
        }
        .tabViewStyle(.page)
        .background(Color.black)
    }
}

#Preview {
    TabbView()
}
