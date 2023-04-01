## Thread in iOS

> Thread는 작업을 수행할 수 있는 프로세스를 수행할 수 있으므로 기본적으로 앱 안에 많은 Thread가 존재
> <br/>
> App을 구성하는 모든 코드는 main Thread 그 안에 특정 thread에 선언되어 수행되는 것
> <br/>

## Intro

[dispatchQueue]("")를 통해서 코드들이 실행될 때 특별히 지정하지 않으면 Main Thread에서 작업이 진행 됌
<br/>

그렇다면 개발을 하다보면 코드가 많아질 것이고 그럼 Main Thread에서 많은 작업을 하게 될 것임 -> App의 속도와 같은 성능이 떨어짐
<br/>

그래서 URL 같은 다운로드 작업([URLSesscion](), [Combine](), [RxSwift]() 등)은 main이 아닌 background에서, Main Thread가 아닌 Background Thread에서 작업하는 것이 가장 이상적임
<br/>

## Thread의 업데이트 과정

1. Main Thread에서 시작
2. App 실행
3. Background Thread로 이동
4. 작업을 수행
5. 수행한 작업을 업데이트하기 전에 Main Thread로 이동
6. 수행 작업 업데이트

```swift
class MainThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []

    func fetchData() {
        let newData = downLoadData()
        dataArray = newData
    }

    // thread 작업을 확인하는 것이니 간단한 [String]으로 진행
    // private 선언하여 클래스 내에서만 액세스 할 수 있게끔 선언
    private func downLoadData() -> [String] {
        var data: [String] = []

        for i in 0..<50 {
            data.append("\(i)")
            print(data)
        }
        return data
    }
}
```

// 이미지

사용자가 앱을 스크롤했을 때 갑자기 속도가 늦어지거나 렉이 발생하면?
<br/>

높은 확률로 Main Thread에서 너무 많은 프로세스가 진행 중이라는 것
<br/>

이 것을 해결하기 위해서는 background Thread로 이동시켜야 함
<br/>

```swift
class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []

    func fetchData() {
        // background 실행을 위해
        DispatchQueue.global(qos: .background).async {

            let newData = self.downLoadData() // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함
            self.dataArray = newData // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함

        }
    }

    // thread 작업을 확인하는 것이니 간단한 [String]으로 진행
    // private 선언하여 클래스 내에서만 액세스 할 수 있게끔 선언
    private func downLoadData() -> [String] {
        var data: [String] = []

        for i in 0..<50 {
            data.append("\(i)")
            print(data)
        }
        return data
    }
}
```

// 이미지
UI를 이동할 때(스크롤할 때)는 여전히 Main Thread에 존재 -> **_UI에 영향을 미치는 모든 작업은 Main Thread에서 수행_**
<br/>

fetchData() 동작 방식
<br/>

- Background Thread에서 데이터를 다운로드, 데이터를 처리하고 데이터를 이동
  <br/>
- DB로 돌아가버릴 때 UI를 업데이트하는 작업을 수행
  <br/>
- Data Array 업데이트
  <br/>
- UI에 View를 업데이트
  <br/>
- Data Array를 업데이트하는 순간 마다 background Thread에 수행
  <br/>

**_즉 Data Array를 업데이트하는 순간 마다 Main Thread에서 수행 되도록 수정_**
<br/>

```swift
func fetchData() {
    DispatchQueue.global(qos: .background).async {
        let newData = self.downLoadData()

        // ata Array를 업데이트
        // 메인으로 명시
        DispatchQueue.main.async {
            self.dataArray = newData
        }
    }
}
```

## Thread 위치 확인

```swift
func fetchData() {
    // background 실행을 위해ß
    DispatchQueue.global(qos: .background).async {
        let newData = self.downLoadData() // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함

        print("data를 처리하고 데이터를 이동, Thread 확인 1 : \(Thread.isMainThread)")
        print("data를 처리하고 데이터를 이동, Thread 확인 1 : \(Thread.current)")

        print("----------------------------------------------------------------")
        DispatchQueue.main.async {
            self.dataArray = newData // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함
            print("data update, Thread 확인 2 : \(Thread.isMainThread)")
            print("data update, Thread 확인 2 : \(Thread.current)")
        }
    }
}
```

## 참고

https://developer.apple.com/documentation/foundation/thread
<br/>
https://seons-dev.tistory.com/entry/SwiftUI-Background-Threads-Queues
<br/>
https://www.hackingwithswift.com/read/9/4/back-to-the-main-thread-dispatchqueuemain
<br/>
https://medium.com/macoclock/update-swiftui-from-background-threads-fa11d07152f4
<br/>
