# ObservedObject

> 입력이 ObservableObject이고 개체의 게시된 속성이 변경될 때 보기를 업데이트하려는 경우 SwiftUI 보기의 매개변수에 @ObservedObject 속성을 추가합니다.
> <br/>
> 일반적으로 StateObject를 하위 보기로 전달하기 위해 이 작업을 수행합니다.
> <br/>
> 다음 예제에서는 데이터 모델을 관찰 가능한 개체로 정의하고 보기에서 모델을 상태 개체로 인스턴스화한 다음 인스턴스를 관찰된 개체로 하위 보기에 전달합니다.
> <br/>

@State같은 경우에는 특정 view에서만 사용하는 프로퍼티였다면 ObservedObject는 더 복잡한 프로퍼티(여러 프로퍼티나 메소드가 있거나, 여러 view에서 공유할 수 있는 커스텀 타입이 있는 경우) 대신 @ObservedObject를 사용
<br/>
String이나 integer같은 간단한 로컬 프로퍼티대신 외부 참조 타입(external reference type)을 사용한다는 점을 제외하면 @State와 매우 유사.
<br/>

- @ObservedObject와 함께 사용하는 타입은 ObservableObject프로토콜을 따라야함.
  <br/>
- observed object가 데이터가 변경되었음을 view에 알리는 방법은 여러가지가 있지만 가장 쉬운 방법은 @Published 프로퍼티 래퍼를 사용하는 것. = SwiftUI에 view reload를 트리거
  <br/>

```swift
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
```

<br/>

주로 ViewModel에 이용
<br/>

[코드 보기](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/PracticePropertyWrapper/PracticePropertyWrapper/ObservedObjectView.swift)
