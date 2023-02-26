//
//  ContentView.swift
//  Stack
//
//  Created by KyungHeon Lee on 2023/01/25.
//

import SwiftUI

struct ContentView: View {
    // VStack의 생성자에서 alignment와 spacing 설정이 가능
    var body: some View {
        VStack(alignment: .leading, spacing: 1.5) {
            Text("Hello, world!")
                .font(.title)
            // 가능
            HStack {
                   Text("sub1 text")
                Spacer()
                   Text("sub2 text")
                 }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
