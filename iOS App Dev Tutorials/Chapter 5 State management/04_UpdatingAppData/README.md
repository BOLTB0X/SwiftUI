# Updating App Data

이번 튜토리얼은 기존에 배웠던 @State,@Binding 등 으로 2가지 기능 추가

- 회의 날짜, 기간 및 참석자를 기록
  <br/>

- 세부 정보 보기는 바인딩을 MeetingView에 전달
  <br/>

## 간단 정리

parent view의 property wrapper의 @state 캡슐화 하여 자식 view의 연결 property wrapper를 @Bindig 처리

```swift
struct MyView:View {
    @Binding private var cities: [String]
    var body:some View {
      // view implementation
    }
}
// 이 보기는 상위 view에서 전달된 initializer 프로퍼티에 대한 바인딩을 사용
```

<br/>

현재 로케일을 사용하여 형식이 지정된 날짜를 view에 적용하는 코드

```swift
struct DateView: View {
   var date: Date
   var body: some View {
      Text(date, style: .date)
   }
}
```
