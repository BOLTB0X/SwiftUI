//
//  CardView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/02/27.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        // update
        // VStack은 수직선에 자식 뷰를 정렬하고 정렬 인수를 사용하여 수평 축을 따라 뷰를 배치
        VStack {
            Text(scrum.title)
                .font(.headline)
            Spacer()
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                // 스크럼의 제목을 표시하는 텍스트 보기에 AccessibilityAddTraits(.isHeader) 수정자를 적용
                // 이 수정자는 스크럼 제목과 "제목"을 읽어 보기의 정보 아키텍처를 전달
                // 접근성 수정자를 사용하여 HStack의 첫 번째 레이블 내용을 설명하는 레이블을 추가
                // HStack의 두 번째 레이블에 유사한 접근성 수정자를 추가
                    .accessibilityLabel("\(scrum.attendees.count) attendees")

                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)

                // .leading, .top 및 .bottom 가장자리에 안쪽 여백을 추가 가능
                    .padding(.trailing, 20)
                
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

// CardView() 이니셜라이저에 DailyScrum 매개 변수가 필요하기 때문에 컴파일러에서 오류가 발생하므로 추가해줘야함
struct CardView_Previews: PreviewProvider {
    static var scrum = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            // scrum.theme.mainColor를 사용하여 미리보기의 배경색을 지정하고 previewLayout 수정자를 사용하여 미리보기 크기를 설정
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
