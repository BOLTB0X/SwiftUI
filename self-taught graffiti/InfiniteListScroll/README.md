# InfiniteListScroll

![img1](https://github.com/V8tr/InfiniteListSwiftUI/raw/master/demo.gif)
<br/>

## Intro

이 [깃허브](https://github.com/V8tr/InfiniteListSwiftUI)의 오픈소스를 보고 벤치마킹하여 학습을 통해 API, Combine의 학습을 하고자 진행
<br/>

## 학습 과정

**_ 코드 한줄 한줄에 주석을 작성하며 진행_**, 위 링크를 클릭 후 주석을 읽으면서 따라가면 이해하기 수월
<br/>

1. 모델 정의와 API fetch부터 진행 [Model+API](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/InfiniteListScroll/InfiniteListScroll/API%2BModels.swift)
   <br/>

2. 이제 view안에 data와 컴포넌트를 감독할 [ViewModel](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/InfiniteListScroll/InfiniteListScroll/ModelsViewModel.swift) 진행
   <br/>

3. 하위 View 부터 최상위 View인 contentView까지 View구성
   <br/>
   List의 하나의 셀을 나타낼 [ModelsRowView](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/InfiniteListScroll/InfiniteListScroll/ModelsRowView.swift)
   <br/>
   위의 셀들을 List로 나타낼 [ModelsListView](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/InfiniteListScroll/InfiniteListScroll/ModelsListView.swift)
   <br/>
   최상위 view이자 @ObservedObject가 선언되는 [ContentView](https://github.com/BOLTB0X/SwiftUI/blob/main/self-taught%20graffiti/InfiniteListScroll/InfiniteListScroll/ContentView.swift)
   <br/>

## 벤치마킹

https://github.com/V8tr/InfiniteListSwiftUI
<br/>
