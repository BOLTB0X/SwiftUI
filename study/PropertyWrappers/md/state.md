## @State

> view 계층 구조에 저장하는 주어진 값 유형에 대한 정보의 단일 소스로 상태를 사용하십시오.
> <br/>
> 속성 선언에 @State 특성을 적용하고 초기 값을 제공하여 앱, 장면 또는 보기에서 상태 값을 만듭니다.
> <br/>
> SwiftUI가 제공하는 스토리지 관리와 충돌할 수 있는 멤버 단위 초기화에서 설정하는 것을 방지하기 위해 상태를 private로 선언합니다.
> <br/>

즉 공식문서를 요약하면
<br/>

- 뷰의 상태(state)로 만들어주는 프로퍼티
  <br/>
- 이 프로퍼티가 변경되면 자동으로 뷰의 데이터도 변경되고, 뷰의 데이터를 바꿔도 이 프로퍼티의 데이터도 자동으로 변경
  <br/>
- 왠만하면 private로 사용
  <br/>

<img width="236" alt="스크린샷 2023-04-17 오후 11 18 02" src="https://user-images.githubusercontent.com/83914919/232518686-76f2789a-e7f2-4878-af3c-3470ee73125b.png">
<br/>

<img width="241" alt="스크린샷 2023-04-17 오후 11 18 19" src="https://user-images.githubusercontent.com/83914919/232519015-12e4c041-aed0-4ee7-bdfc-8dd4ac9db935.png">
<br/>

이를 코드로 구현하면
<br/>

```swift
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
```

[코드보기](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/PracticePropertyWrapper/PracticePropertyWrapper/StateView.swift)
<br/>

## 참고

https://developer.apple.com/documentation/swiftui/state
