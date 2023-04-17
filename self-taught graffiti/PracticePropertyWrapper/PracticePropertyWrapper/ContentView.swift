//
//  ContentView.swift
//  PracticePropertyWrapper
//
//  Created by KyungHeon Lee on 2023/03/13.
//

import SwiftUI

// 상위 뷰
struct ContentView: View {
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
