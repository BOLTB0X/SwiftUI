//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/01.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        // 이 단계의 목록 이니셜라이저는 ViewBuilder를 유일한 매개변수로 허용
        // HStack 및 VStack과 같은 다른 컨테이너 보기에서 사용했던 것과 동일한 구문으로 행을 추가 가능
        List {
            ForEach(scrums, id: \.title) { scrum in
                //  스크럼 배열과 제목 속성의 키 경로를 이니셜라이저에 전달
                // ForEach는 컬렉션의 개별 항목을 식별하는 방법이 필요
                // 테스트 데이터의 모든 스크럼이 다른 이름을 가지고 있기 때문에 제목 속성을 사용하여 각 항목을 식별
                // ForEach 클로저에서 CardView를 초기화
                // 클로저는 scrums 배열의 각 요소에 대한 CardView를 반환
                CardView(scrum: scrum)
                    .listRowBackground(scrum.theme.mainColor)

            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        // ScrumsView_Previews에서 스크럼 배열을 ScrumsView 이니셜라이져
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
