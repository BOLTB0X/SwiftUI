//
//  BindingView.swift
//  PracticePropertyWrapper
//
//  Created by KyungHeon Lee on 2023/03/14.
//

import SwiftUI

// @Binding 은 다른 인스턴스 소유의 @State 프로퍼티를 빌려올 때 사용
// 원래는 상위 view의 @State 뷰로 연결해서 사용
// 두 값이 양방향 연결이어서 한쪽의 값이 변한다면 다른 한쪽도 변경

struct BindingView: View {
    @Binding var name: String
    
    var body: some View {
        VStack {
            Text("\(name)")
                .padding()
            Button(action: {
                nameToggle()
                
            }, label: {
                Text("누르세요")
            })
        }
    }
    
    func nameToggle() {
        if name == "Hello" {
            name = "Wolrd"
        } else {
            name = "Hello"
        }
    }

}

struct BindingView_Previews: PreviewProvider {
    static var previews: some View {
        BindingView(name: .constant("Hello"))
    }
}
