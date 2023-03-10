//
//  StateView.swift
//  PracticePropertyWrapper
//
//  Created by KyungHeon Lee on 2023/03/13.
//

import SwiftUI

// @State 는 특정 프로퍼티를 뷰의 상태(state)로 만들어준다. 즉 이 프로퍼티가 변경되면 자동으로 뷰의 데이터도 변경되고, 뷰의 데이터를 바꿔도 이 프로퍼티의 데이터도 자동으로 변경
struct StateView: View {
    @State private var name = "Hello"
    
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

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
