//
//  ContentView.swift
//  PracticeState
//
//  Created by KyungHeon Lee on 2023/02/11.
//

import SwiftUI

// 상태 프로퍼티 (State Property)
// 뷰 내부에서 특정 View 의 상태를 나타내는 변수
// 뷰내부에서 밖에 사용이 불가능함 때문에 private로 선언해야함
// state property에 해당하는 변수 값이 변경되면 view를 다시 랜더링 -> 항상 최신값을 가짐

struct ContentView: View {
    @State private var Name = ""
    
    var body: some View {
        VStack {
            // Name이라는 상태 프로퍼티와 바인딩 됨
            TextField("이름을 입력해주세요: ", text: $Name)
            Text(Name) // 변경되더라도 업데이트 됨
            // 즉 상태 프로퍼티를 통해 변경되더라도 항상 최신 값을 갖는 것
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
