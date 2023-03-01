/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]
    
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                // 대상은 사용자가 요소와 상호 작용할 때 탐색 계층 구조에서 단일 보기를 제공
                // 각 행은 개별 대상으로 푸시
                // 텍스트 보기는 다음 섹션에서 세부 정보 화면을 생성할 때까지 자리 표시자 역할
//                NavigationLink(destination: Text(scrum.title)) {
//                    CardView(scrum: scrum)
//                        .listRowBackground(scrum.theme.mainColor)
//                }
                // NavigationLink를 업데이트하여 DetailView를 새 대상으로 설정
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        // 도구 모음을 추가하고 더하기 아이콘을 표시하는 단추 도구 모음 항목을 추가
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            // 시뮬레이터에서 앱을 빌드 및 실행하고 행에서 scrum.title 보기로 이동할 수 있는지 확인
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView를 추가하면 제목 및 막대 단추와 같은 탐색 요소가 캔버스에 표시
        NavigationView {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
