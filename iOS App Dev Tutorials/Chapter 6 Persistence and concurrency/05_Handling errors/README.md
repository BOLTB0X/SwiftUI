# Handling Errors

> 앱을 개발하는 동안 구문 또는 의미 체계 오류를 발견하고 수정했을 수 있음
> <br/>
> 그러나 통제할 수 없는 예기치 않은 문제는 여전히 발생할 수 있고 네트워크 연결이 끊어질 수 도 있음
> <br/>
> 파일에서 데이터 읽기는 여러 가지 방법으로 실패할 수 있음
> <br/>
> Scrumdinger에서 문제가 발생하면 지침을 제공하여 이러한 오류를 처리합니다.
> <br/>

<br/>

```swift
@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error,
                                                    guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error,
                                                guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

// 앱의 데이터에 액세스하는 중에 오류가 발생할 수 있음

//수정으로 사용자가 오류 보기를 닫을 때 일부 샘플 데이터를 제공

// onDismiss 클로저에서 스크럼 배열에 샘플 데이터를 할당, 사용자가 모달을 닫을 때 샘플 데이터를 로드
// 프레젠테이션을 시작하는 조건에 바인딩을 제공하기 때문에 SwiftUI는 사용자가 프레젠테이션을 닫을 때 선택적 오류 래퍼를 nil로 재설정
```

[Handling Errors](https://developer.apple.com/tutorials/app-dev-training/handling-errors)에서 이번 튜토리얼 프로젝트를 가져옴
<br/>

## 퀴즈

1. Why is an enum that conforms to Error a good type to represent errors in your app?
   <br/>

   Your app can have a limited number of errors, and the system handles types that conform to Error
   <br/>
   앱에는 제한된 수의 오류가 있을 수 있으며 시스템은 오류를 준수하는 유형을 처리
   <br/>

   숫자는 유한한 수의 값을 나타내며 Error에 대한 적합성은 오류 처리를 위한 Swift 모델
   <br/>

---

2. Which feature of iOS apps protects your app data from other apps writing to it?
   <br/>
   App Sandbox
   <br/>
   App Sandbox는 파일 시스템의 포함된 부분에 대한 앱의 액세스를 제한하여 시스템 리소스 및 사용자 데이터를 보호함
   <br/>

---

3. Use the following code to answer the question. Which SwiftUI view correctly displays a machine error for the MachineError type?

```swift
enum MachineError: Error {
    case invalidSelection
    case insufficientPower
    case powerIsOff
}


struct MachineErrorView: View {
    var error: MachineError

    var body: some View {
        Text(error.localizedDescription)
    }
}
// 오류의 localizedDescription 속성은 오류에 대한 지역화된 문자열 설명을 제공
```
