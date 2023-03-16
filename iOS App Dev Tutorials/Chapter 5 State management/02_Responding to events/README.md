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

## Scene architecture

<img src="https://docs-assets.developer.apple.com/published/f852de8a8170db339183fad5c3a6b548/SUI_067-010-010~dark@2x.png" width="200" height="400"/>
<br/>
<img src="https://docs-assets.developer.apple.com/published/f852de8a8170db339183fad5c3a6b548/SUI_067-010-010~dark@2x.png" width="200" height="400"/>
<br/>
<img src="https://docs-assets.developer.apple.com/published/f852de8a8170db339183fad5c3a6b548/SUI_067-010-010~dark@2x.png" width="200" height="400"/>
<br/>
