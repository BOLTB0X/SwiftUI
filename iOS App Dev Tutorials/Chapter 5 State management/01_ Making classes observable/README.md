# Making classes observable

> @State 및 @Binding property wrappers를 사용하여 뷰 계층 구조에서 업데이트를 트리거하기 위한 정보 소스로 값 유형을 정의
> <br/>
> @ObservedObject, @StateObject, and @EnvironmentObject
> <br/>
> 이 챕터에서는 reference type을 앱 UI의 정보 소스로 정의하는 방법을 배움
> <br/>
> 이러한 property wrappers를 클래스와 함께 사용하려면 클래스를 관찰 가능하게 만들어야 합

## Making a class observable

### @Published

```swift
class ScrumTimer: ObservableObject {
   @Published var activeSpeaker = ""
   @Published var secondsElapsed = 0
   @Published var secondsRemaining = 0
   // ...
}
```

ObservableObject 프로토콜을 채택하여 클래스를 관찰 가능하게 만들 수 있음
<br/>
변경 시 UI 업데이트를 트리거해야 하는 클래스의 속성을 기존에 다른 걸 선언해줘야 함
<br/>
ScrumTimer는 게시된 속성 값이 변경되면 관찰자에게 알려줌
<br/>

## Monitoring an object for changes

ObservedObject, StateObject 또는 EnvironmentObject 속성 중 하나를 추가하여 관찰 가능한 객체를 모니터링하도록 SwiftUI에 지시 가능
<br/>

### @StateObject

```swift
struct MeetingView: View {
   @StateObject var scrumTimer = ScrumTimer()
   // ...
}
```

@StateObject wrapper는 보기에서 관찰 가능한 개체를 만들어준다거
<br/>
시스템은 보기를 만들 때 개체를 초기화하고 개체를 해당 보기 또는 개체를 전달하는 다른 보기에서 사용할 수 있도록 유지
<br/>
즉 이제 @State-@Binding 처럼 값 Int, String 프로퍼티를 넘어 객체로 상태변화를 UI에 나타낸다고 생각하면 됌
<br/>

### @ObservedObject

```swift
struct ChildView: View {
   @ObservedObject var timer: ScrumTimer
   // ...
}
```

@ObservedObject wrapper는 다른 보기에서 개체를 전달했음을 나타내고 사용
<br/>
다른 뷰에서 개체를 생성하기 때문에 ObservedObject에 대한 초기 값을 제공 X
<br/>

### @StateObject와 @ObservedObject의 차이

```swift
struct MeetingView: View {
   @StateObject var scrumTimer = ScrumTimer()
   var body: some View {
      VStack {
         ChildView(timer: scrumTimer)
      }
   }
   // ...
}
```

@StateObject은 앞서 초기화가 가능하니 다른 뷰로 전달이 가능 즉 @State와 같은 역할
<br/>
@ObservedObject은 @Binding 역할
<br/>

### environmentObject

```swift
struct ParentView: View {
   @StateObject var scrumTimer = ScrumTimer()
   var body: some View {
      VStack {
         ChildView()
            .environmentObject(scrumTimer)
      }
   }
   // ...
}
```

objects를 개별 보기로 전달하는 대신 개체를 환경에 배치 가능
<br/>
environmentObject(\_:) 보기 수정자는 상위 보기의 환경에 개체를 배치
<br/>
즉 명시적인 주입 체인 없이 개체에 액세스할 수 있음
<br/>

### @EnvironmentObject

```swift
struct ChildView: View {
   @EnvironmentObject var timer: ScrumTimer
   // ...
}
```

@EnvironmentObject property wrapper를 사용하여 계층 구조의 중간 보기에 개체에 대한 참조가 없더라도 부모 보기의 모든 하위 항목에 있는 개체에 액세스 가능
<br/>
SwiftUI는 데이터를 읽는 보기의 종속성만 추적한다고 함
<br/>
즉 주로 Present, Navigation을 사용할 때 rootview에 사용
<br/>
