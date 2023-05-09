//
//  ContentView.swift
//  SwiftUIButton
//
//  Created by KyungHeon Lee on 2023/05/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Default", action: {
            }).buttonStyle(DefaultButtonStyle())

            Spacer()
            
            Button("Borderless", action: {
            }).buttonStyle(BorderlessButtonStyle())
            
            Spacer()
            
            Button("Plain", action: {
            }).buttonStyle(PlainButtonStyle())

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
