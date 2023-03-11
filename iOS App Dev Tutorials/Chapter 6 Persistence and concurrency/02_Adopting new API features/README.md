# Adopting new API features

> 각 SDK 릴리스에는 새로운 기술, 프레임워크 및 언어 기능이 포함 됌
> <br/>
> 이전 버전의 운영 체제와의 호환성을 유지하면서 새로운 API를 채택하는 방법을 배운다
> <br/>

-> 즉 iOS 버전이 업그레이드 되면 호환이 안될 수도 있으니 이를 대처하는 방법을 배우는 챕터임
<br/>

즉 버전 별 iOS 나 SwiftUI를 지원기기를 확인해야함
<br/>
공식사이트에서 확인 가능: https://support.apple.com/ko-kr/guide/iphone/iphe3fa5df43/ios
<br/>

## Xcode으로 버전 확인

<img src="https://docs-assets.developer.apple.com/published/8b360fa1e5ca15b9ec45fb91ee387b34/SUI_103-010~dark@2x.png">
Xcode 프로젝트의 각 대상에는 앱을 실행할 수 있는 운영 체제의 가장 초기 버전을 지정하는 배포 대상 설정 기능이 존재
<br/>

> ScrumsList에서 구분 기호를 숨기기 위해 iOS 15.0에 도입된 listRowSeparator(\_:edges:) 수정자를 사용하기로 결정했다고 가정합니다. 한정자를 추가하면 해당 메서드는 iOS 15.0 이상에서만 사용할 수 있기 때문에 Xcode에서 컴파일러 오류를 표시하지만 앱은 여전히 ​​iOS 14.0을 지원합니다. 오류를 수정하려면 Scrumdinger의 배포 대상을 iOS 15.0으로 설정합니다. 그러나 대상을 변경하면 앱이 더 이상 iOS 15.0 이전의 모든 iOS 버전에서 실행되지 않습니다.
> -> 버전 업그레이드로 인해 앱이 잘 동작 되지 않으면
