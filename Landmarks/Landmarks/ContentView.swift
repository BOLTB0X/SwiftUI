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
        // 정렬 leading
        VStack(alignment: .leading) {
            Text("Landmarks")
                .font(.body) // 폰트
                .fontWeight(.medium) // 폰트 두께
                .foregroundColor(.gray)
            HStack {            Text("SwiftUI Landmarks")
                    .font(.subheadline) //밑에 줄
                    .foregroundColor(.red)
                Text("Test UI")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
