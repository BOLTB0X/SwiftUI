//
//  ContentView.swift
//  ScrollView
//
//  Created by KyungHeon Lee on 2023/02/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<100) { i in
                        CircleView(label: "\(i)")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
            .frame(height: 100)
            Divider()
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircleView: View {
    @State var label: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 70, height: 70)
            Text(label)
        }
    }
}
