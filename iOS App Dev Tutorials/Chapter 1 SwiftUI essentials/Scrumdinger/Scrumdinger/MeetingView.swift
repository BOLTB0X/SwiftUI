//
//  ContentView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/02/26.
//

import SwiftUI

// 기본 SwiftUI 보기 파일은 두 개의 구조를 선언
// 첫 번째 구조는 View 프로토콜을 준수하며 View를 반환하는 본문 속성이라는 단일 요구 사항
// 그러므로 body 속성에서 보기의 콘텐츠, 레이아웃 및 동작을 설명해야함
struct MeetingView: View {
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

// 두 번째 구조는 해당 뷰가 캔버스에 표시되도록 미리보기를 선언
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
