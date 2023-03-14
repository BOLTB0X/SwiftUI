//
//  ObservedObjectView.swift
//  PracticePropertyWrapper
//
//  Created by KyungHeon Lee on 2023/03/14.
//

import SwiftUI

// @ObservedObject
// @State같은 경우에는 특정 view에서만 사용하는 프로퍼티였다면 ObservedObject는
// 더 복잡한 프로퍼티(여러 프로퍼티나 메소드가 있거나, 여러 view에서 공유할 수 있는 커스텀 타입이 있는 경우) 대신 @ObservedObject를 사용
// - String이나 integer같은 간단한 로컬 프로퍼티대신 외부 참조 타입(external reference type)을 사용한다는 점을 제외하면 @State와 매우 유사.

// - @ObservedObject와 함께 사용하는 타입은 ObservableObject프로토콜을 따라야함.
 
// - observed object가 데이터가 변경되었음을 view에 알리는 방법은 여러가지가 있지만 가장 쉬운 방법은 @Published 프로퍼티 래퍼를 사용하는 것. = SwiftUI에 view reload를 트리거
class MyModel: ObservableObject {
    @Published var name = "Hello"

    func nameToggle() {
        if name == "Hello" {
            name = "Wolrd"
        } else {
            name = "Hello"
        }
    }
}

struct ObservedObjectView: View {
    // 연결
    @ObservedObject var data = MyModel()
    
    var body: some View {
        VStack {
            Text("\(data.name)")
                .padding()
            Button(action: {
                data.nameToggle()
                
            }, label: {
                Text("누르세요")
            })
        }
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView()
    }
}
