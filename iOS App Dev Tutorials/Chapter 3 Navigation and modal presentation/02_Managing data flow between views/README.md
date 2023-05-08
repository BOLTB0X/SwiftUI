# Managing data flow between views

> 사용자에게 정보를 표시하고 사용자 상호 작용에 대한 응답으로 데이터를 수정하는 것은 대부분의 앱의 필수 기능이라 함
> <br/>

이 챕터에서는 @State 및 @Binding을 사용하여 사용자 인터페이스가 앱 데이터의 현재 상태를 반영하는지 확인하는 방법을 배움
<br/>

## Source of truth

SwiftUI에서의 **Source of Truth**란 데이터의 일관성과 정확성을 유지하는 중요한 개념을 의미
<br/>

> data의 여러 사본을 유지하면 불일치가 발생하여 앱에 버그가 발생할 수 있음
> <br/>
> dara 불일치 버그를 방지하려면 앱의 각 데이터 요소에 대해 신뢰할 수 있는 단일 소스를 사용해야 함
> <br/>
> 요소를 진실의 출처인 한 위치에 저장하면 여러 뷰에서 동일한 데이터에 액세스할 수 있음
> <br/>
> 코드 전체에서 신뢰할 수 있는 소스를 만들 수 있고 각 정보 소스를 정의하는 방법과 위치는 데이터가 여러 보기에서 공유되는지 여부와 데이터가 변경되는지 여부에 따라 다름
> <br/>

SwiftUI에서는 모델인 @State와 같은 프로퍼티 언래핑에 의해 UI가 바인딩되어 있음
<br/>
UI는 모델의 변경에 의해서 자동으로 반응하고 변경되어 질 것
<br/>
하지만 이렇게 UI를 변경하는 상태가 여러곳에서 복사되고 변경되고 사용되어 진다면, 이는 사용자 경험(UX)의 일관성이나 정확성 유지에 굉장히 취약해 진다는 단점이 존재(사이드 이팩트가 발생함)
<br/>

그러므로 SwiftUI에서는 **@State, @Binding, @ObservedObject, @EnvironmentObject** 등의 프로퍼티 래퍼를 아용하여 모델을 관리하는 것
<br/>

## Swift property wrappers

#### @State

사용자 상호 작용은 @State 속성을 변경할 수 있고 시스템은 해당 속성에 의존하는 보기를 업데이트하여 새 버전의 사용자 인터페이스를 렌더링함
<br/>

![img1](https://docs-assets.developer.apple.com/published/9fa0b905ff484f12c53ac1cf634c1a0b/SUI045_001~dark@2x.png)
<br/>

> @State 속성 값이 변경되면 시스템은 업데이트된 속성 값을 사용하여 view를 자동으로 다시 그림
> <br/>
> 예를 들어 사용자가 Scrumdinger에서 스크럼을 수정하면 ScrumsView는 업데이트된 값을 표시하기 위해 목록을 다시 그림
> <br/>
> 상태 속성은 단추의 강조 표시 상태, 필터 설정 또는 현재 선택된 목록 항목과 같은 일시적인 상태를 관리하는 데 도움이 되므로 상태 속성을 private로 선언하고 let로 사용하면 안 됨
> <br/>

<br/>

#### @Binding

@Binding으로 래핑하는 속성은 @State 프로퍼티과 같은 기존 소스와 읽기 및 쓰기 액세스를 공유
<br/>

@Binding은 데이터를 직접 저장 X, 기존 정보 소스와 해당 데이터를 표시하고 업데이트하는 보기 사이에 양방향 연결을 생성
<br/>

이 연결을 통해 데이터 조각과 연결된 여러 보기가 동기화되는 것
<br/>

![img2](https://docs-assets.developer.apple.com/published/1247dc2ffdac302f9d7ed3acac0b5675/SUI045_002~dark@2x.png)
<br/>

> 시스템은 @State의 데이터와 @Binding이 포함된 자식 view 간에 종속성을 설정
> <br/>
> 부모 또는 자식 보기는 원본으로 정의한 프로퍼티를 읽거나 수정이 가능
> <br/>
> 자식 view가 부모에 정의된 소스와 읽기 전용 관계인 경우 값을 자식 보기에 간단히 전달할 수 있음
> <br/>
> 두 경우 모두 프레임워크는 Source of truth에 대한 변경 사항을 반영하도록 두 보기를 자동으로 업데이트
> <br/>

## App architecture

바인딩을 사용하여 신뢰할 수 있는 단일 소스를 전파하는 이 패턴은 뷰 계층 구조의 모든 수준에 효과적이라 함
<br/>

## 퀴즈

1. What does labeling a property as @State in SwiftUI do?
   <br/>

   **@State는 로컬 프로퍼티을 변경 가능하게 만들고 @State를 정의하는 view는 프로퍼티의 변경 사항을 관찰하고 그에 따라 view의 적절한 부분을 업데이트합**
   <br/>
   @State는 프로퍼티을 정의한 view와 부모 view에서 프로퍼티을 변경 가능하게 만듬
   <br/>

2. Which property wrapper can you add to the beginning of a child view’s declaration to include a reference to the parent view’s @State property?
   <br/>
   **@Binding**
   <br/>
   @Binding으로 레이블이 지정된 프로퍼티는 다른 곳에서 정의된 @State 프로퍼티 또는 소스를 참조함
   <br/>
