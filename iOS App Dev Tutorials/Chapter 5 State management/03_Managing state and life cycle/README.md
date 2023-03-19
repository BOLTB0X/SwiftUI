# Managing State and Life Cycle

## Life Cycle

정리글은 [여기](https://github.com/BOLTB0X/Swift_Study/tree/main/study/LifeCycle)
<br/>

## SwiftUI의 동작 방식

정리글은 [여기](https://github.com/BOLTB0X/SwiftUI/tree/main/study/SwiftUIBasic/Test)
<br/>

## accessibility in SwiftUI

TODO: 추가예정
<br/>

## @StateObject

공식문서 튜토리얼에서 @StateObject 첫등장
<br/>
@state대신 @StateObject를 사용, 왜냐하면 view의 수명 주기 동안 reference type을 저장하는 property wrapper
<br/>
@StateObject로 래핑하면 보기의 수명 주기 동안 개체가 활성 상태로 유지
<br/>

## onAppear(perform:)

view가 표시될 때 작업을 트리거하는 SwiftUI 수명 주기 메서드
<br/>
onAppear(perform:)은 view가 screen에 나타날 때 작업을 수행
<br/>

## onDisappear(perform:)

view가 화면을 떠날 때 작업을 트리거하는 SwiftUI 수명 주기 메서드
<br/>
onDisappear(perform:)은 뷰가 화면에서 사라질 때 작업을 수행
<br/>
