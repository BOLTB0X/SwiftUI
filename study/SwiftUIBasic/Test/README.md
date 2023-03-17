# SwfitUI 동작 방식

프로젝트명+App
<br/>

```swift
import SwiftUI

@main
struct TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

## @main

@main 기능은 앱의 시작점인 Entry Points 를 지정하는 것
<br/>
기존 방식인 AppDelegate에서 프레임워크 및 리소스 초기화를 진행 -> SwiftUI 에서는Initializers를 통해 초기화를 구현
<br/>

## AppDelegate 에서 사용하던 기능 예시 SwiftUI에서는?

기존엔 Appdelegate에서 제공되는 메서드를 통해 앱이 활성화, 즉 백그라운드에서 포그라운드로 전환시 앱내 사용할 데이터를 세팅 해준다던가, 혹은 비활성화시에 앱에서 사용중인 캐시를 flush 해줬지만
<br/>
swiftUI 에선 다른 방식으로 대체하게 됌 그게 'ScenePhase'
<br/>

iOS14부터 Apple은 새로운 기능ScenePhase새로운 제공
<br/>

SwiftUI 에서는 @Environment 속성 래퍼를 사용하여 값을 가져오고 onChange(of:) 수정자를 사용하여 변경사항을 수신함으로서 코드에서 현재 값에 접근 할 수 있도록 함
<br/>

```swift
import SwiftUI

@main
struct TestApp: App {
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { newScenePhase in
            switch newScenePhase {
            case .active:
              print("App is active")
            case .inactive:
              print("App is inactive")
            case .background:
              print("App is in background")
            @unknown default:
              print("Oh - interesting: I received an unexpected new value.")
            }
          }
    }
}
```

## 참고

https://huniroom.tistory.com/entry/iOS14SwfitUI-SwiftUI-life-cycle-에서-딥링크-처리
