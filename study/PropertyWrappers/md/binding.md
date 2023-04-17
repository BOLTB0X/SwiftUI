# @Binding

> 바인딩을 사용하여 데이터를 저장하는 속성과 데이터를 표시하고 변경하는 보기 간에 양방향 연결을 만듭니다.
> <br/>
> 바인딩은 데이터를 직접 저장하는 대신 속성을 다른 곳에 저장된 정보 소스에 연결합니다.
> <br/>
> 예를 들어 재생과 일시 중지 사이를 전환하는 버튼은 바인딩 속성 래퍼를 사용하여 부모 보기의 속성에 대한 바인딩을 만들 수 있습니다.
> <br/>

즉 @Binding 은 다른 인스턴스 소유의 @State 프로퍼티를 빌려올 때 사용
<br/>
원래는 상위 view의 @State 뷰로 연결해서 사용하며 두 값이 양방향 연결이어서 한쪽의 값이 변한다면 다른 한쪽도 변경
<br/>

<img width="236" alt="스크린샷 2023-04-17 오후 11 18 02" src="https://user-images.githubusercontent.com/83914919/232518686-76f2789a-e7f2-4878-af3c-3470ee73125b.png">
<br/>

<img width="241" alt="스크린샷 2023-04-17 오후 11 18 19" src="https://user-images.githubusercontent.com/83914919/232519015-12e4c041-aed0-4ee7-bdfc-8dd4ac9db935.png">
<br/>

```swift
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
```

<br/>

```swift
import SwiftUI

// 상위 뷰
struct ContentView: View {

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
```

<br/>

[코드 보기](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/PracticePropertyWrapper/PracticePropertyWrapper/BindingView.swift)

## 참고

https://developer.apple.com/documentation/swiftui/binding
<br/>
