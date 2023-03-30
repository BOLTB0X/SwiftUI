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

<img src="/img/state1.png", height="800", width="300">

<img src="/img/state2.png", height="800", width="300">

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

---

## 참고

https://developer.apple.com/documentation/swiftui/state
