# Persisting data

## Codable

> A type that can convert itself into and out of an external representation
> <br/>
> 간략히 Codable은 Encodable과 Decodable 프로토콜을 결합한 유형 별칭
> <br/>
> 기존 Encodable과 Decodable의 정의는
> <br/>
> Encodable -> 모델을 Encoder에서 변환해주려는 프로토콜(ex json)로 변환
> <br/>
> Decodable -> data(ex json등)를 원하는 모델로 디코딩
> <br/>
> 이들을 합쳐준 것이 Codable, json뿐만 아니라 struct, enum, class도 가능
> <br/>

```swift
enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    ...
    case yellow

    var accentColor: Color {
        ...
    }

    ..
}
```

자세한 것은 stduy에 추가 예정
<br/>

## @escaping

클로저가 함수의 인자로 전달됐을 때, 함수의 실행이 종료된 후 실행되는 클로저
<br/>

```swift
static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
    DispatchQueue.global(qos: .background).async {
        do {
        } catch {
        }
    }
}
```

load() 함수의 completion 인자로 전달
<br/>
completion이 DispatchQueue에게 전달되어 load 메소드가 값을 반환하고 종료
<br/>
completion은 아직 실행 X
<br/>
즉, completion은 함수의 실행이 종료되기 전에 실행되지 않기 때문에 함수 밖에서 실행되는 클로저라고 생각하면 됌
<br/>

자세한 것은 stduy에 추가 예정
<br/>

## @StateObject

> Create connections between your app’s data model and views.
> <br/>
> 뷰 안에서 안전하게 StateObject를 이용하여 ObservedObject 인스턴스 생성
> <br/>

```swift
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
```

자세한 것은 stduy에 추가 예정
<br/>

## 참고

1. 공식 튜토리얼 주소
   https://developer.apple.com/tutorials/app-dev-training/persisting-data)
   <br/>

2. 문서 주소
   https://developer.apple.com/documentation/swift/codable
   https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
   https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app
   <br/>
