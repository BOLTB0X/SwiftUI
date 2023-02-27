//
//  ContentView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/02/26.
//

import SwiftUI

// 기본 SwiftUI 보기 파일은 두 개의 구조를 선언
// 첫 번째 구조는 View 프로토콜을 준수하며 View를 반환하는 본문 속성이라는 단일 요구 사항
// 그러므로 body 속성에서 보기의 콘텐츠, 레이아웃 및 동작을 설명해야함

// Refactor > Rename
struct MeetingView: View {
    var body: some View {
        
        // ProgressView를 Command를 누른상태로 마우스 클릭 -> Stack을 embed 가능
        // 스택을 사용하여 보기 구성 요소를 결합하고 계층화
        VStack {
            // 진행률 보기를 사용하여 스크럼 동안 경과된 시간의 백분율을 표시
            // 진행률 보기는 앱이 데이터를 로드하는 경우와 같이 불확실한 진행률을 표시할 수도 있음
            ProgressView(value: 5, total: 15)
            HStack {
                // 보기를 수정하기 위해 소스 편집기, 캔버스, 라이브러리 또는 인스펙터를 사용하는지 여부에 관계없이 코드는 업데이트된 상태로 유지
                
                // VStack에 후행 정렬을 추가
                //
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                    // SwiftUI 보기를 사용자 지정하려면 수정자로 알려진 메서드를 호출
                        .font(.caption)
                    // 이미지는 포함된 SF 기호 중 하나를 사용
                    // 시스템은 이러한 기호를 글꼴처럼 취급하므로 사용자의 장치 설정에 따라 동적으로 확장
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                    
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            // children view 무시 선언
            .accessibilityElement(children: .ignore)
            // 사용자가 요소의 목적을 이해할 수 있도록 레이블과 값에 충분한 컨텍스트가 있는지 고려
            .accessibilityLabel("Time remaining")
            // 남은 시간에 대한 접근성 값을 HStack에 추가
            // 하위 뷰의 값을 의도적으로 무시했기 때문에 HStack에 값을 추가
            // 그렇지 않으면 SwiftUI는 하위 보기의 값을 자동으로 유추
            .accessibilityValue("10 minutes")
            
            Circle()
                .strokeBorder(lineWidth: 24)
            HStack {
                Text("Speaker 1 of 3")
                Spacer()
                //  나중에 다음 스피커로 타이머 링을 진행하는 동작
                Button(action: {}) {
                    Image(systemName: "forward.fill")
                }
                .accessibilityLabel("Next speaker")

            }
        }
    }
}

// 두 번째 구조는 해당 뷰가 캔버스에 표시되도록 미리보기를 선언
struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
