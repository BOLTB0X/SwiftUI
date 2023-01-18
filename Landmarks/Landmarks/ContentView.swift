//
//  ContentView.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/01/14.
//

import SwiftUI

// View를 상속받는 ContentView 구조체
struct ContentView: View {
    var body: some View {
        // 10개 이상 하려면
        Form {
            Text("Hello ,SwiftUI!")
            Group {
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
            }
            Group {
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
                Text("Hello ,SwiftUI!")
            }
            // 그냥 Text를 10 개 이상 선언시 에러
            // 최상위 View는 최대 10 Child View
                .font(.title)
                .foregroundColor(.red)
        }.navigationTitle("this is Title")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
