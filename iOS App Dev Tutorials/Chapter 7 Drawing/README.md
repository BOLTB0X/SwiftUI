# Drawing the Timer View

> Scrumdinger는 일일 스크럼 회의 중에 진행 상황을 추적하여 각 참석자에게 동일한 양의 발언 시간을 제공함
> 그리고 앱은 각 발표자를 나타내는 원의 세그먼트를 사용하여 회의 진행 상황을 표시함

이 튜토리얼에서는 이 프로그레스 뷰를 그리는 데 필요한 뷰를 생성
<br/>

### Binding 미리보기 적용

```swift
struct MyView: View {
    @Binding var names: [String]
    var body: some View {
        List(names, id: \.self) { name in
            Text(name)
        }
    }
}

struct MyView_Preview: PreviewProvider {
    @State static var names = ["Jonathan", "Lucy", "Kim"]
    static var previews: some View {
        MyView(names: $names)
    }
}
```

프로퍼티 이름은 정적 @State 속성이므로 $names로 바인딩에 액세스
<br/>

### path

```swift
struct MyShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path {  path in
            path.addLine(to: CGPoint(x: 100, y: 100))
        }
     }
}
```

### 도형에 각도 넣기

```swift
Rectangle()
   .rotation(Angle(degrees: 45))
```
