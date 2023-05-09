# OnTapGesture

> View가 탭 제스처를 인식할 때 수행할 작업을 추가
> <br/>

<br/>

```swift
func onTapGesture(
    count: Int = 1,
    perform action: @escaping () -> Void
) -> some View

```

- count
  액션에 제공된 액션 클로저를 트리거하는 데 필요한 탭 또는 클릭 수, 기본값은 1
  <br/>

- action
  수행할 작업
  <br/>

## 주로 사용하는 목적

이 메서드를 사용하여 사용자가 보기 또는 컨테이너를 클릭하거나 탭할 때 지정된 작업을 수행
<br/>

> Button과 기능적으로 동일한 컨트롤을 만드는 경우 대신 ButtonStyle을 사용하여 사용자 지정 버튼을 만듭니다.
> <br/>
> 아래 예에서 하트 이미지의 색상은 사용자가 보기를 두 번 클릭하거나 탭할 때마다 색상 배열에서 임의의 색상으로 변경됩니다.
> <br/>

<figure class="third">
    <img width="233" alt="스크린샷 2023-05-09 오후 12 29 40" src="https://user-images.githubusercontent.com/83914919/236994951-a507e71d-add1-46df-a1f7-e5e9a4d466ec.png">
    <img width="234" alt="스크린샷 2023-05-09 오후 12 29 53" src="https://user-images.githubusercontent.com/83914919/236994957-c133672d-a5bc-4fef-9315-2ec6d4708f6c.png">
    <img width="232" alt="스크린샷 2023-05-09 오후 12 30 06" src="https://user-images.githubusercontent.com/83914919/236994960-adf880fa-895b-441f-ba0c-3f078de0876c.png">
figure>

<br/>

```swift
struct ContentView: View {
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]
    @State private var fgColor: Color = .gray

    var body: some View {
        VStack {
            Image(systemName: "doc.text.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(fgColor)
                .onTapGesture(count: 2) { // 두 번 클릭하거나 탭할 때마다 색상 배열에서 임의의 색상으로 변경
                    fgColor = colors.randomElement()!
                }
            Spacer()
        }
    }
}
```

## Button과 onTapGesture 차이

onTapGesture에게 커스텀 버튼 스타일 등은 사용할 수 없음
<br/>

## 참고

[apple Developer 공식문서](<https://developer.apple.com/documentation/charts/chart/ontapgesture(count:perform:)/>)
<br/>
