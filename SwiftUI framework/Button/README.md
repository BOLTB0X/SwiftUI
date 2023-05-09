# Predefined Button in SwiftUI

> A control that initiates an action.
> <br/>

```swift
struct Button<Label> where Label : View
```

<br/>

SwiftUI에서 기본으로 생성되는 코드

```swift
Button(action: { } ) { Text(" ") }
```

<br/>

## 기본적인 버튼

사용자가 버튼을 클릭하거나 탭할 때 작업을 수행하는 메서드 또는 클로저
<br/>

label은 취소 텍스트 또는 뒤로 가기와 같은 아이콘을 표시하여 단추의 동작을 실행하는 View
<br/>

- 텍스트 같이 가장 기본적인 버튼을 이용할 때

```swift
var body: some View {
    Button("텍스트 문구") {
        // code
    }
}
```

<br/>

- 이미지를 넣을 때처럼 커스텀을 진행할 경우

```swift
 // 주로 커스텀할 떄 이용
    Button {
        // 실행할 코드
    } label: {
        Image(systemName: "circle.fill")
    }

    Button(action: {
        // action code
    }) {
        // label 또는 View
        VStack {
            Text("우헤헤헤헤")
        }
    }
```

<br/>

## Color 및 font 적용

```swift
Button(action: {
    print("삭제 클릭")
}) {
    HStack {
        Image(systemName: "trash")
            .font(.title)

        Text("Delete")
            .fontWeight(.semibold) // 폰트의 두께
            .font(.title) // 폰트 변경
        }
        .padding() // 간격
        .foregroundColor(.white) // 글씨 색깔
        .background(Color.green) // 버튼 범위에
        .cornerRadius(40) // 모서리를 둥글게
}
```

<br/>

<img width="231" alt="스크린샷 2023-05-09 오전 11 20 52" src="https://user-images.githubusercontent.com/83914919/236978496-f4bd2ac4-815b-41c4-ab34-7485d971b099.png">
<br/>

```swift
// 그라데이션 넣기
Button(action: {
    print("삭제 클릭")
}) {
    HStack {
        Image(systemName: "trash")
            .font(.title)

        Text("Delete")
            .fontWeight(.semibold) // 폰트의 두께
            .font(.title) // 폰트 변경
        }
        .padding() // 간격
        .foregroundColor(.white) // 글씨 색깔
        .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing)) // 그라데이션
        .cornerRadius(40) // 모서리를 둥글게
}
```

<br/>

<img width="228" alt="스크린샷 2023-05-09 오전 11 23 13" src="https://user-images.githubusercontent.com/83914919/236978821-d39d60a7-e2ad-42a1-80d5-51fd7119e580.png">
<br/>

## 컨테이너에 버튼 추가

작업을 시작하는 모든 사용자 인터페이스 요소에 버튼을 추가할 수 있음
<br/>

버튼은 이러한 다양한 컨테이너 및 컨텍스트 내에서 예상되는 스타일과 일치하도록 시각적 스타일을 자동으로 조정이 됨 예를 들어 사용자가 선택했을 때 작업을 시작하는 목록 셀을 만들려면 목록 콘텐츠에 버튼을 추가되도록 할수 있음
<br/>

```swift
List {
    // 모든 현재 폴더를 표시하는 셀
    ForEach(folders) { folder in
        Text(folder.title)
    }

    // 선택 시 새 폴더를 추가하는 셀
    Button(action: addItem) {
        Label("Add Folder", systemImage: "folder.badge.plus")
    }
}
```

다른 비슷한 방법으로 작업을 시작하는 컨텍스트 메뉴 항목을 만들려면 contextMenu(\_:) 수정자로 콘텐츠 클로저에 버튼을 추가할 수 있음

```swift
.contextMenu {
    Button("Cut", action: cut)
    Button("Copy", action: copy)
    Button("Paste", action: paste)
}
```

<br/>
<img src="https://docs-assets.developer.apple.com/published/2e12c7d7fbb038ed1f0b771ba84656df/Button-1~dark@2x.png" width="228" height="110">

## predefined buttonStyle

기본적으로 **DefaultButtonStyle**, **BorderlessButtonStyle**, **PlainButtonStyle**을 제공
<br/>

#### DefaultButtonStyle

> 기본적으로 적용되는 값. 모든 OS에서 공통으로 사용할 수 있는 버튼 스타일
> <br/>

```swift
Button("Default", action: {
}).buttonStyle(DefaultButtonStyle())
```

<br/>

<img width="231" alt="스크린샷 2023-05-09 오전 11 59 11" src="https://user-images.githubusercontent.com/83914919/236983952-b4799fcb-97cd-4085-ba35-4464b74abd40.png">

<br/>

#### BorderlessButtonStyle

> IOS에서 대부분의 경우에 기본 반영되는 스타일. 테두리를 그리지 않음
> <br/>
> 현재 IOS에서 제공하는 스타일 중에 테두리는 그리는 버튼은 없지만 MacOS에선 BorderedButtonStyle이 함께 제공되므로 이것과 대조되는 의미에서 이 스타일이 제공
> <br/>

```swift
Button("Borderless", action: {
}).buttonStyle(BorderlessButtonStyle())
```

<br/>

<img width="238" alt="스크린샷 2023-05-09 오후 12 00 59" src="https://user-images.githubusercontent.com/83914919/236983960-ac719299-b443-4f33-90ae-c7f087c76e84.png">
<br/>

#### PlainButtonStyle

> 모든 OS에서 공통으로 사용할 수 있는 버튼 스타일로, 유휴 상태(IDLE)에서는 버튼의 콘텐츠에 어떠한 시작적 요소도 적용하지 않음
> <br/>

```swift
Button("Plain", action: {
}).buttonStyle(PlainButtonStyle())
```

<br/>

<img width="236" alt="스크린샷 2023-05-09 오후 12 01 21" src="https://user-images.githubusercontent.com/83914919/236983969-4f28b71f-a783-492c-a7b1-d1c2176e5e9e.png">
<br/>

---

- onTapGesture
  <br/>

  [onTapGesture]() 참고
  <br/>

- 프로퍼티 언래핑과 사용하는 경우
  <br/>

  [PropertyWrappers](https://github.com/BOLTB0X/SwiftUI/tree/main/study/PropertyWrappers) 참고
  <br/>

## 참고

[developer문서](https://developer.apple.com/documentation/swiftui/button)
<br/>

[서근 개발 블로그](https://seons-dev.tistory.com/entry/Button버튼)
<br/>

[sarunw](https://sarunw.com/posts/swiftui-buttonstyle/)
<br/>
