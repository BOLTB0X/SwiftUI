# Adopting Swift concurrency

> 비동기 함수를 정의하고 호출하는 방법을 알아보고 구조화된 동시성이 복잡한 비동기 함수를 단순화하는 방법을 배우는 챕터
> <br/>

## Simplifying asynchronous code

저저번 챕터에서 추가한 load(completion:) function

```swift
static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
  DispatchQueue.global(qos: .background).async {
      do {
          // Decode scrums
          DispatchQueue.main.async {
              completion(.success(dailyScrums))
          }
      } catch {
          DispatchQueue.main.async {
              completion(.failure(error))
          }
      }
  }
}
```

UI 응답성을 유지하기 위해 함수는 백그라운드 대기열에서 스크럼 데이터를 디코딩
<br/>
다음 완료 클로저를 사용하여 백그라운드 작업이 완료된 후 기본 큐의 저장소를 업데이트
<br/>
콜백 기반 비동기 코드는 Swift에서 일반적이지만 특히 완료 처리기를 서로 중첩하는 경우 읽기 어려운 케이스도 있음
<br/>
Swift 5.5는 새로운 async/await 패턴을 도입, 다음 챕터에 배울 예정
<br/>

## Defining an asynchronous function

async 및 await를 사용하여 비
<br/>동기 함수를 정의하고 호출하는 방법

```swift
class ViewModel: ObservableObject {
   @Published var participants: [Participant] = []

   func fetchParticipants() async -> [Participant] {...}
}
```

매개변수 목록 뒤와 함수가 값을 반환하는 경우 반환 화살표(->) 앞에 async 키워드를 추가하여 비동기 함수 정의
<br/>

## Calling an asynchronous function

```swift
class ViewModel: ObservableObject {
   @Published var participants: [Participant] = []

   func refresh() async {
      let fetchedParticipants = await fetchParticipants()
      self.participants = fetchedParticipants
   }
   func fetchParticipants() async -> [Participant] {

   }
}
```

await 키워드를 사용하여 비동기 함수를 호출 가능
<br/>
대기 중인 코드는 실행을 일시 중단할 수 있으므로 다른 비동기 함수의 본문 내부와 같은 비동기 컨텍스트에서만 await를 사용
<br/>

```swift
struct ContentView: View {
   @StateObject var model = ViewModel()

   var body: some View {
      NavigationView {
         List {
            Button { // ContentView의 버튼은 Task를 사용하여 refresh()를 호출
               Task {
                  await model.refresh()
               }
            } label: {
               Text("Load Participants")
            }
            ForEach(model.participants) { participant in
               ...
            }
         }
      }
   }
}
```

작업을 생성하여 동기 컨텍스트에서 동기 함수
<br/>

SwiftUI는 보기가 나타날 때 비동기 함수를 실행하는 데 사용할 수 있는 작업 수정자를 제공
<br/>

```swift
struct ContentView: View {
   @StateObject var model = ViewModel()

   var body: some View {
      NavigationView {
         List {
            ForEach(model.participants) { participant in

            }
         }
         .task {
            await model.refresh()
         }
      }
   }
}
```

보기가 사라지면 시스템이 작업을 자동으로 취소
<br/>
