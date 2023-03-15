# Modernizing Asynchronous Code

> Persisting data에서 작성한 로드 및 저장 메서드는 비동기식이지만 새로운 async/await 패턴과 호환 X
> 이 tutorial에서는 다른 비동기 코드에서 호출할 수 있도록 이러한 메서드에 대한 비동기 인터페이스를 만듬
> <br/>
> 이번 챕터는 비동기함수 호출 동작방식 이해를 배우는 게 목적
> <br/>
> Swift는 비동기 코드와 기존 콜백 기반 API를 연결하는 여러 기능을 제공

그러므로 이 튜토리얼에서 동작되는 방식을 정리하고 study에 추가 예정
<br/>
간단히 요약하면 View를 나타낼 때 비동기로 data를 상태 변화 및 API 호출하도록 메소드 및 코드를 추가하는 챕터
<br/>

## Create an asynchronous load method

```swift
class ScrumStore: ObservableObject {
    ...
    ...
    ...
    static func load() async throws -> [DailyScrum] {
    }
}
```

<br/>

ScrumStore.swift에서 스크럼 배열을 반환하는 load라는 정적 메소드 선언
<br/>
매개 변수 목록 뒤에 async 키워드를 추가하면 함수가 비동기임을 나타냄
<br/>
throw 함수의 경우 throws 키워드 앞에 async를 작성
<br/>

TODO
