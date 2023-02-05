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
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top) // 화면의 상단 가장자리까지 확대 (safeArea 무시)
                .frame(height: 300) // width 생략시 뷰 width에 맞춰짐
            CircleImage()
                .offset(y: -130) // y축 기준 -130 offset
                .padding(.bottom, -130) // 뷰 하단을 기준으로 -130만큼 패딩 지정
            Text("Landmarks")
                .font(.body) // 폰트
                .fontWeight(.medium) // 폰트 두께
                .foregroundColor(.gray)
            HStack {            Text("SwiftUI Landmarks")
                    .font(.subheadline) //밑에 줄
                    .foregroundColor(.red)
                Spacer() // 여백 추가
                Text("Test UI")
                    .font(.subheadline)
                    .foregroundColor(.orange)
            } // HStck 전체
            .font(.subheadline)
            
            Divider() // 구분선
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
