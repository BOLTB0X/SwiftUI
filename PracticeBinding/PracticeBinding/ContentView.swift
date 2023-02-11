//
//  ContentView.swift
//  PracticeBinding
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

// 프로퍼티는 뷰 내부용 -> 밖에서 사용하지 못함
// 만약 하위 뷰나 다른 뷰에서 사용하려면
// -> @Binding 써야함
// 뷰 전체가 다시 랜더링 되는일을 막기위해 하위뷰로 데이터 변동이 반영되는 뷰만 됨($) 즉, 그 뷰에 binding 해줘야 함

struct ContentView: View {
    @State private var isCheck = true
    @State private var pw = ""
    
    var body: some View {
        VStack {
            // state 처리
            Toggle(isOn: $isCheck) {
                Text(isCheck == true ? "와이파이 켜짐" : "와이파이 꺼짐")
            }.padding()
            TextField("암호 입력: ", text: $pw).padding()
            if pw.isEmpty && isCheck == true {
                Text("암호 미 입력")
            } else if !pw.isEmpty && isCheck == true {
                Text("입력 완료")
            }
            WifiImageView(isCheck: $isCheck)
        }.border(Color.black, width: 2).padding()
    }
}

// 와이파이 이미지 뷰
// 바인딩 처리를 위해 선언
struct WifiImageView: View {
    @Binding var isCheck: Bool // 외부에서 쓰기 위해 바인딩 처리
    var body: some View {
        Image(systemName: isCheck ? "wifi" : "wifi.slash")
            .resizable()
            .frame(width: 150, height: 120, alignment: .center)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
