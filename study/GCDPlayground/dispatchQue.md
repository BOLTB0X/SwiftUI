## DispatchQueue: 작업 항목의 실행을 관리하는 클래스
> 디스패치 대기열은 애플리케이션이 블록 객체 형식으로 작업을 제출할 수 있는 FIFO 대기열입니다.
> <br/>
> 디스패치 큐는 작업을 순차적으로 또는 동시에 실행합니다. 디스패치 대기열에 제출된 작업은 시스템에서 관리하는 스레드 풀에서 실행됩니다.
> <br/>
> 앱의 기본 스레드를 나타내는 디스패치 대기열을 제외하고 시스템은 작업을 실행하는 데 사용하는 스레드에 대해 보장하지 않습니다.
> <br/>
> 작업 항목을 동기식 또는 비동기식으로 예약합니다.
> <br/>
> 작업 항목을 동기식으로 예약하면 해당 항목의 실행이 완료될 때까지 코드가 대기합니다.
> <br/>
> 작업 항목을 비동기적으로 예약하면 작업 항목이 다른 곳에서 실행되는 동안 코드가 계속 실행됩니다.
> <br/>

***즉 앱의 기본 스레드 또는 백그라운드 스레드에서 순차적으로 또는 동시에 작업 실행을 관리하는 개체***
<br/>

## Seral과 Concurrent

dispatchQueue는 Seral과 Concurrent로 나뉨
<br/>

- seral: 이전 작업이 끝나면 다음 작업을 순차적으로 실행하는 직렬 형태의 Queue
<br/>
한 작업을 실행하고 그 실행이 끝날 때까지 대기열에 있는 다른 작업을 잠시 미루고 있다가 바로 전의 작업이 끝나면 실행
<br/>

- Concurrent: 이전 작업이 끝날 때 까지 기다리지 않고 병렬 형태로 동시에 실행되는 Queue 
<br/>
즉 대기열에 있는 작업을 동시에 별도의 Thread를 사용하여 실행
<br/>

## CGD : Grand Central Dispatch

### Main(serial)
> 현재 프로세스의 메인 스레드와 관련된 디스패치 큐
> <br/>

즉 현재 프로세스의 Main Thread와 연결된 dispatchQueue
<br/>

서버(api)로부터 전달받은 data를 view나 viewcontroller, viewModel에 넣어줄 때 view의 관련 변화나 갱신에 대한 소스가 담긴 클로저를 main Queue로 보냄
<br/>

```swift
print("1")
DispatchQueue.main.async {
    print("슈우우우우우ㅜ우우웅1")
 
}
print("2")
DispatchQueue.main.async {
    print("슈우우우우우ㅜ우우웅2")
 
}
print("3")
 
DispatchQueue.main.async {
    print("슈우우우우우ㅜ우우웅3")
}

// 1
// 2
// 3
// 슈우우우우우ㅜ우우웅1
// 슈우우우우우ㅜ우우웅2
// 슈우우우우우ㅜ우우웅3
```
위 출력 결과를 보면 알수 있듯이 runloop가 끝나야 Queue에 들어가 있는 task들이 순차적으로 실행되는 것을 알수 있음
<br/>

이는 Main Queue는 Main Thread에서 돌아가기 때문
<br/>

### Global(concurrent)
> 시스템 전체에 공유되는 concurrent Queue
> <br/>

병렬적으로 동시에 실행이 되긴 하지만 QoS를 통해 우선순위를 결정 가능
<br/>
우선순위가 높은 작업은 낮은 순위의 작업보다 더 빨리 실행
<br/>

> QoS(Quality of Service)
> <br/>
> DispatchQueue에서 수행 할 작업을 분류하기 위해 사용됩니다.
> <br/>
> QoS를 지정해줘서 중요도를 표시하고, 시스템이 우선순위를 정하고 이에 따라 스케쥴링을 하게 됨
> <br/>

즉 DispatchQueue의 Concurrent Queue는 Queue에 담긴 작업을 동시에 실행하며, Global Queue 또는 Custom Queue로 사용가능
<br/>

```swift
var defaultQueue = DispatchQueue.global(qos: .default)
print("1")
defaultQueue.async {
    print("슈우우우우우ㅜ우우웅1")
}
print("2")
defaultQueue.sync {
    print("슈우우우우우ㅜ우우웅2")
}
print("3")
defaultQueue.async {
    print("슈우우우우우ㅜ우우웅3")
}
print("4")
defaultQueue.sync {
    print("슈우우우우우ㅜ우우웅4")
}
```

### qos의 종류
```swift
DispatchQueue.global(qos: .userInteractive) {}  //Main Queue
DispatchQueue.global(qos: .userInitiated) {}    //유저가 시작한 작업, 유저가 응답을 기다림
DispatchQueue.global(qos: .default) {}          //userInitiated와 utility의 중간
DispatchQueue.global(qos: .utility) {}          //시간이 걸리며 즉각적인 응답이 필요하지 않은 경우
DispatchQueue.global(qos: .background) {}       //눈에 보이지 않는 부분의 작업. 완료 시간 중요X
DispatchQueue.global(qos: .unspecified) {}
```

아래로 갈수록 우선순위가 떨어짐
<br/>

## 참고
https://developer.apple.com/documentation/dispatch/dispatchqueue
<br/>
https://developer.apple.com/documentation/dispatch/dispatchqueue/1781006-main
<br/>
https://seons-dev.tistory.com/215
<br/>
https://zeddios.tistory.com/972
<br/>
https://furang-note.tistory.com/37
<br/>
https://developer.apple.com/documentation/dispatch/os_dispatch_queue_concurrent
<br/>
