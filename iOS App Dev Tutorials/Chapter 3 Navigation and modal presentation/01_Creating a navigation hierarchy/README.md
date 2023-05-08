# Creating a Navigation Hierarchy

> 이 챕터에서는 Navigation Hierarchy(계층) 구조를 만드는 것을 배움
> <br/>

[Creating a Navigation Hierarchy](https://developer.apple.com/tutorials/app-dev-training/creating-a-navigation-hierarchy) 여기서부터 튜토리얼 진행
<br/>

## NavigationStack

NavigationStack 컨테이너 view에서 Hierarchy층 구조의 View 스택을 Navigation 가능
<br/>

ScrumsView.swift 파일에서 목록을 래핑하여 탐색을 설정
<br/>

```swift
NavigationStack {
    List(scrums) { scrum in
        CardView(scrum: scrum)
            .listRowBackground(scrum.theme.mainColor)
    }
}
.navigationTitle("Daily Scrums") // 상위 탭에 제목 설정 가능

```

![img1](https://docs-assets.developer.apple.com/published/17e642e1f9f5974ba26eef290ccb97d2/SUI040-010-020-preview.png)
<br/>

즉 기존 List로 뿌려줬던 것에 Navigation을 입혀준다 생각하면 됌
<br/>

## Hierarchy

![img2](https://docs-assets.developer.apple.com/published/5ba0d8fd3499c8489de400d897d78060/SUI040_002~dark@2x.png)
<br/>
hierarchical 앱에서는 상위 view에서 child View로 이동하여 특정 데이터 요소를 조작 가능

```swift
NavigationStack {
    List(scrums) { scrum in
        NavigationLink(destination: DetailView(scrum: scrum)) { // 자식 뷰로 이동 가능
            CardView(scrum: scrum)
    }
    .listRowBackground(scrum.theme.mainColor)
}
```

<br/>

![img3](https://docs-assets.developer.apple.com/published/52385dc37b8e00f9da28e99ed72c0792/SUI040_005~dark@2x.png)
<br/>

또한 자식 view에서 그 자식 view의 자식 view로 가도록 설정이 가능
<br/>

## 퀴즈

1. Which code snippet places the app’s main user interface inside a navigation stack?
   <br/>

```swift
@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
    }
}
```

<br/>

NavigationStack은 navigation hierarch에서 보기 스택을 제공하는 컨테이너 View임
<br/>

2. Which code snippet adds this DetailView to the navigation stack?

```swift
struct DetailView: View {
    var body: some View {
        VStack {
            Text("Tacos al Pastor")
            Text("Ingredients: pork, pineapple, cilantro, onion, avocado")
        }
    }
}
```

<br/>

```swift
struct CategoryView: View {
    var body: some View {
        List {
            Section(header: Text("Categories")) {
                NavigationLink(destination: DetailView()) {
                    Label("Tacos", image: "tacos")
                }
            }
        }
    }
}
// NavigationLink는 DetailView에 목적지를 표시
```

<br/>

3. Which code snippet displays the navigation title in the NavigationStack?
   <br/>

```swift
struct ListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Cats")) {
                    NavigationLink(destination: CatsView()) {
                        Text("Duncan")
                    }
                }
            }
            .navigationTitle("Adoptable Animals")
        }
    }
}
```

<br/>

제목 및 막대 항목과 같은 탐색 수정자를 자식 view에 추가하면 시스템에서 수정자를 부모 NavigationStack에 알림
<br/>
