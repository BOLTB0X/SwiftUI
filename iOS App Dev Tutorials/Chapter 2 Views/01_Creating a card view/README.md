# Creating a Card View

> Scrumdinger는 user가 참석하는 일일 스크럼 목록을 보관하고 해당 목록을 root View에 표시
> <br/>
> 이번 챕터에서는 일일 스크럼 요약을 표시하는 CardView를 빌드
> <br/>

[Creating a Card View](https://developer.apple.com/tutorials/app-dev-training/creating-a-card-view) 여기서 프로젝트를 가져와서 진행
<br/>

모델정의, 확장, view 구성, 프리뷰 활용을 배움
<br/>

1. How should you add 10 points of space between Text and Label in this code snippet?
   <br/>

```swift
var body: some View {
    VStack {
        Text("Daily Scrum")
            .padding(.bottom, 10) // add
        Label("People", image: "person")
    }
 }
```

<br/>

---

2. Which framework should you import to define the structure?
   <br/>

```swift
import SwiftUI

struct Person {
   var name: String
   var age: Int
   var favoriteColor: Color // 이것때문에 swiftUI
}
```

<br/>

---

3. How should you set the accessibility label on Image in the code snippet below?
   <br/>

```swift
var body: some View {
    Image(systemName: "person")
        .accessibilityLabel("Person") // add
}
```

<br/>
