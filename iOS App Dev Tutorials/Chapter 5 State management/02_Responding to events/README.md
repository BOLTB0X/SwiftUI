# Responding to events

> 지금까지 이 모듈에서 배운 것처럼 SwiftUI 속성 래퍼를 사용하여 앱 UI의 상태를 관리하고 사용자 상호작용에 응답할 수 있습니다.
> <br/>
> 이 문서에서는 SwiftUI 장면 아키텍처, 앱 상태, 화면에서 나타나고 사라지는 보기를 포함하여 이벤트에 응답하는 보기를 다룹니다.
> <br/>
> 이 Tutorial 에서는 SwiftUI 장면 아키텍처, 앱 상태, 화면에서 나타나고 사라지는 view를 포함하여 이벤트에 응답하는 view를 다룹
> <br/>

요즘 앱들을 보면 사용자의 터치같은 것에 의해 반응하는 것들 을 많이봄
<br/>
실상 앱이 살아있는 것아니라 view 구성에 Property wrapper을 사용하면서 app 상태를 대응하는 것
<br/>
그러므로 이벤트에 따른 view 구성을 공부해야함
<br/>
앱이 반응하는 것을 제대로 알아볼려면 SwiftUI의 scene의 구성을 알 필요가 있음
<br/>

## Scene architecture(Scene 구조)

<img src="https://docs-assets.developer.apple.com/published/f852de8a8170db339183fad5c3a6b548/SUI_067-010-010~dark@2x.png" width="200" height="250"/>
<br/>
앱을 만들려면 앱 프로토콜을 준수하는 구조를 정의 
<br/>
정의 앞에 @main 속성을 사용하여 이것이 앱의 유일한 진입점임을 시스템에 알림
<br/>
Listing Data in a List에서 Scrumdinger의 root view를 ScrumsView로 설정할 때 앱의 구조로 작업
<br/>

<img src="https://docs-assets.developer.apple.com/published/7767537c43e8a87dab42f47104d4c517/SUI_067-010-020~dark@2x.png" width="200" height="250"/>
<br/>
ScrumdingerApp 내의 구조 본문에서 Scene 프로토콜을 따르는 하나 이상의 scene을 추가
<br/>
scene은 앱이 제공하는 view 계층 구조의 컨테이너
<br/>
예를 들어 iOS 및 watchOS에서는 하나의 장면을 표시하지만 macOS 및 iPadOS에서는 여러 장면을 표시하도록 앱을 디자인 가능
<br/>

<img src="https://docs-assets.developer.apple.com/published/4b40f7fe6816ea302f7d25284681a0be/SUI_067-010-030~dark@2x.png" width="200" height="250"/>
<br/>
SwiftUI는 Scrumdinger가 사용하는 WindowGroup과 같은 기본 장면을 제공
<br/>
시스템은 장면의 수명 주기를 관리하고 플랫폼 및 컨텍스트에 적합한 view 계층 구조를 표시
<br/>
예를 들어 iPadOS의 멀티태스킹은 동일한 앱의 여러 작은 인스턴스를 동시에 표시할 수 있음
<br/>

---

## Scene phases and transitions (scene 단계 및 전환)

앱 실행 중에 장면은 다음 세 단계로 전환될 수 있음
<br/>

- active
  scene이 앞에 있고 사용자가 장면과 상호 작용할 수 있음
  <br/>

- inactive
  scene이 표시되지만 시스템이 scene과의 상호 작용을 비활성화
  <br/>

예를 들어 멀티태스킹 모드에서 다른 패널과 함께 앱의 패널을 볼 수 있지만 활성 패널은 아님
<br/>

- background
  앱이 실행 중이지만 scene이 UI에 표시되지 X
  <br/>
  scene은 앱이 종료되기 전에 이 단계에 들어감
  <br/>

<img src="https://docs-assets.developer.apple.com/published/225ce549433aa563c7f7d0b9161bbdd9/SUI_067-010-040~dark@2x.png" width="200" height="250"/>
<br/>
scene은 앱이 종료되기 전에 이 단계에 들어감
<br/>
scenePhase 환경 값을 사용하여 장면의 현재 상태를 읽을 수 있음
<br/>

경우에 따라 scene이 다른 단계로 전환될 때 앱이 일련의 작업을 수행
<br/>
지속성(Persistence) 및 동시성(Concurrency) 챕터에서는 Scrumdinger의 onChange(of:perform:) 수정자를 사용하여 여러 실행에서 앱 상태를 저장했음
<br/>
이 수정자를 사용하여 장면 단계가 비활성화될 때 앱 데이터를 저장하는 작업을 트리거 함
<br/>
