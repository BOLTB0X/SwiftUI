# Passing Data with Bindings

> 이전 챕터에서는 편집 view와 해당 view 내의 개별 UI 컨트롤 간에 데이터를 공유하기 위해 바인딩을 사용했습니다.
> <br/>
> 이제 테마 선택기와 편집 보기가 데이터를 공유할 수 있도록 하는 바인딩을 사용하여 색상 테마 선택기를 빌드하여 편집 기능을 확장하는 것을 배우는 챕터
> <br/>

<br/>

[Passing Data with Bindings](https://developer.apple.com/tutorials/app-dev-training/passing-data-with-bindings)에서 프로젝트를 가져옴
<br/>

## Pass a binding into the detail view

![img1](https://docs-assets.developer.apple.com/published/7855668b68acbc8ee1d4e7c5332c5974/SUI060_004~dark@2x.png)
<br/>

```swift
@Binding var scrums: [DailyScrum]

    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                // Binding<DailyScrum>을 DetailView 이니셜라이저에 전달
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }

            ... 생략 ...
```

바인딩을 사용하면 사용자의 상호 작용이 스크럼을 수정할 때 DetailView가 다시 렌더링
<br/>

## 퀴즈

1. Which code snippet displays LoginMessageView in the preview canvas?

```swift
struct LoginMessageView: View {
   @Binding var name: String
   var body: some View {
      Text("Welcome back, \(name)")
   }
}
```

root view
<br/>

```swift
struct LoginMessageView_Previews: PreviewProvider {
   static var previews: some View {
      LoginMessageView(name: .constant("John"))
   }
}
// 상수 바인딩을 사용하여 변경할 수 없는 값에 대한 바인딩을 만듬
```

<br/>

2. Which code snippet lets ChildView modify the message that appears in ParentView?

```swift
struct ParentView: View {
    @State private var message = "Hello world"
    var body: some View {
        VStack {
            ChildView(text: $message)
            if !message.isEmpty {
                Text(message)
            }
        }
    }
}

// 바인딩을 사용하여 데이터를 변경해야 하는 다른 보기에 데이터를 전달할 수 있음
```

3. What is the type of $book.identifier?

```swift
struct Book {
    var title: String
    var identifier: Int
}

@State private var book = Book(title: "The Adventures of Smudge", identifier: 19237)
```

**$book.identifier**는 book의 식별자 속성에 대한 **Binding(바인딩)**을 검색해야 함

<br/>
