# Creating the Edit View

> 이번 챕터에서는 스크럼을 편집하는 컨트롤이 포함된 새 view를 만듬
> <br/>
> SwiftUI는 iOS 앱에 대한 모든 표준 컨트롤을 제공
> <br/>

[Creating the Edit View](https://developer.apple.com/tutorials/app-dev-training/creating-the-edit-view)에서 튜토리얼 프로젝트 이용
<br/>

## @State properties

![img1](https://docs-assets.developer.apple.com/published/c75d92f418023b6cdb79e4d9bb3aa785/SUI050_010-intro~dark@2x.png)
<br/>

DailyScrum 프로퍼티에 스크럼에 대한 변경 사항을 저장
<br/>

view 내에서 프로퍼티를 변경해야 하므로 @State 래퍼를 사용하여 속성을 정의하고 SwiftUI는 @State 속성을 관찰하고 속성이 변경되면 보기의 본문을 자동으로 다시 그림
<br/>

이 동작은 사용자가 화면 컨트롤을 조작할 때 사용자 인터페이스가 최신 상태로 유지되도록 함
<br/>

## Present View

```swift
// 목록에 시트 수정자를 추가
// sPresentingEditView가 true로 변경되면 앱은 기본 콘텐츠를 부분적으로 덮는 모달 시트를 사용하여 DetailEditView를 표시
// 모달 보기는 앱의 기본 탐색 흐름에서 사용자를 제거
// 짧고 독립적인 작업에 양식을 사용
// 다양한 유형의 모달 프레젠테이션과 앱에서 모달을 효과적으로 사용하는 경우에 대한 자세한 내용은 휴먼 인터페이스 지침의 모달을 참조
    .sheet(isPresented: $isPresentingEditView) {
        NavigationView {
            // 스크럼 세부 정보에 대한 변경 사항을 취소하고 있음을 사용자에게 나타내는 도구 모음 버튼을 추가
            // 취소 버튼 동작에서 DetailEditView를 닫음
            DetailEditView()
                .navigationTitle(scrum.title)
            // 사용자에게 변경 사항을 저장하고 있음을 나타내는 도구 모음 버튼을 추가
            // 완료 버튼 동작에서 DetailEditView를 닫음
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                        }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    isPresentingEditView = false
            }
        }
    }
```

<br/>

## 퀴즈

1. How do you initialize a Slider view that lets the user pick only the values 5.0, 10.0, 15.0, and 20.0?

<br/>

```swift
Slider(value: $itemCount, in: 5...20, step: 5.0)
```

<br/>

Slider 이니셜라이저에 범위 및 단계 값을 전달
<br/>

2. Which modifier can you add to the button to present EditView?

```swift
struct ContentView: View {
    @State private var isPresented = false
    var body: some View {
        Button(action: { isPresented = true }) {
            Text("Edit")
        }
        // 정답
          .sheet(isPresented: $isPresented) {
            EditView()
        }
        //
    }
}
```

<br/>

시트 수정자는 Bool 및 뷰 빌더에 대한 바인딩을 사용
<br/>

3. Which code snippet removes an element from the names array?

```swift
var body: some View {
   List {
       ForEach(names, id: \.self) { name in
           Text(name)
       }
    }
 }
```

<br/>

```swift
ForEach(names, id: \.self) { name in
     Text(name)
}
.onDelete { indices in
    names.remove(atOffsets: indices)
}
```

<br/>

remove(atOffsets:) 메서드는 IndexSet을 사용하여 배열에서 요소를 제거
<br/>
