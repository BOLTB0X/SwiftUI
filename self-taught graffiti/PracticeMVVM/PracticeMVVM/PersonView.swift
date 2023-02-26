//
//  PersonView.swift
//  PracticeMVVM
//
//  Created by KyungHeon Lee on 2023/02/09.
//

import SwiftUI

// @State 변수
// ViewModel의 역할, View가 외부의 State에 의존적이지 않게 해줌
// State가 변할 때마다 UI가 리프레시될 수 있는 구독 메커니즘 Binding 제공

// Model: data 컨테이너
struct Person {
    var name: String
    // var age: Int
    // 여기까지는 Model에서 View까지 전달 가능
    var birthady: Date // 날짜를 나이로 변환해줘야하는 경우 view model이 필요함
}

// View: SwiftUI 뷰
struct PersonView: View {
    // ViewModel을 가져옴
    @StateObject var viewModel = PersonViewModel()
    
    var body: some View {
        VStack {
            Text(viewModel.name)
                .padding()
            Text(viewModel.age)
                .padding()
            Button("이름변경") {
                if viewModel.name == "경헌" {
                    viewModel.changeName("나한")
                } else {
                    viewModel.changeName("경헌")
                }
            }
        }
    }
}

// ViewModel : 비즈니스 로직을 캡슐화한 ObservableObject
// View가 state, age등 변화를 관찰할 수 있도록 허용
// 이것을 통해 View에 전달
class PersonViewModel: ObservableObject {
    // @Published속성 추가
    // 이걸 해주지 않으면 view 적용이 안됌
    @Published var kyungheon = Person(name: "경헌", birthady: Date())
    
    var name: String {
        kyungheon.name
    }
    
    var age: String {
        // Date를 나이로 변환
        return "30"
    }
    
    func changeName(_ name: String) {
        kyungheon.name = name
    }
}
