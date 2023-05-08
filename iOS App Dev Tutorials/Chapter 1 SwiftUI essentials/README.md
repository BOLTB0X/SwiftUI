# SwiftUI essentials

> SwiftUI의 기본 구성 요소를 사용하여 Scrumdinger용 적응형 사용자 인터페이스를 만들어보는 챕터
> <br/>
> view를 추가 및 수정하고 앱의 접근성을 개선
> <br/>

튜토리얼 앱을 통해 Scrum list, Scrum detail and edit, Meeting timer 등의 view를 구성하며 SwiftUI를 배워 봄
<br/>

## 챕터 퀴즈

<br/>

1. Which code snippet creates this view?
   <br/>

![img1](https://docs-assets.developer.apple.com/published/702d91c34dabbcf0bf12ea3930bd3904/SUI010-040-010-cyu~dark@2x.png)
<br/>

```swift
VStack {
    Text("Inventory")
        .font(.title)
    HStack { // 수평을 표현하기 위해
        Label("Paperclips", systemImage: "paperclip.circle.fill")
        Text("3")
    }
}
```

<br/>

---

2. Which code snippet sets the font for the text view?
   <br/>

```swift
VStack(alignment: .leading) {
    Text("Inboxes")
        .font(.headline) // 메소드 이용
}
```

<br/>

---

3. Which code snippet produces the output “Skip song. Button.” from VoiceOver?
   <br/>

```swift
var body: some View {
    Button(action: {}) {
        Label("Skip song", systemImage: "forward")
    }
    .accessibilityLabel(Text("Skip song"))
}
```

VoiceOver는 systemImage 값을 읽으므로 요소를 설명하는 접근성 레이블을 추가해야 함
<br/>

VoiceOver가 이미 읽고 있는 특성이기 때문에 "버튼"을 포함할 필요가 X
<br/>

## Accessibility modifiers

> disabilities 있는 사람을 포함하여 모든 사람이 SwiftUI 앱에 액세스할 수 있도록 합니다
> <br/>

```swift
// children view 무시 선언
.accessibilityElement(children: .ignore)
// 사용자가 요소의 목적을 이해할 수 있도록 레이블과 값에 충분한 컨텍스트가 있는지 고려
.accessibilityLabel("Time remaining")
// 남은 시간에 대한 접근성 값을 HStack에 추가
// 하위 뷰의 값을 의도적으로 무시했기 때문에 HStack에 값을 추가
// 그렇지 않으면 SwiftUI는 하위 보기의 값을 자동으로 유추
.accessibilityValue("10 minutes")
```

<br/>

이번 챕터에서 사용한 Accessibility 수정자
<br/>

SwiftUI는 모든 보기에 대한 접근성 modifiers를 제공한다 함
<br/>

접근성 수정자를 사용하면 View에 대한 레이블과 값을 쉽게 설정하고 접근성 특성과 작업을 추가할 수 있음
<br/>
