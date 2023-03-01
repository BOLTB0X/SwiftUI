//
//  DetailView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/01.
//

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum

    var body: some View {
        List {
            // 회의 정보 헤더가 있는 섹션을 추가
            // 섹션은 목록 내에서 시각적 구분을 만들어 목록 보기의 정보 계층에서 콘텐츠를 청크하고 그룹을 설정하는 데 도움줄 수 있음
            Section(header: Text("Meeting Info")) {
                // MeetingView를 대상으로 설정하는 NavigationLink로 회의 시작 레이블을 래핑
                // NavigationLink를 추가하면 사용자가 이 행을 탭하여 회의 타이머 화면으로 전환할 수 있도록 제스처 인식기에서 레이블을 래핑
                NavigationLink(destination: MeetingView()) {
                    // "Start Meeting" 텍스트와 타이머 아이콘이 포함된 레이블을 추가
                    // foregroundColor 및 글꼴 수정자를 추가하여 레이블의 모양을 변경
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                    // HStack을 생성하고 회의 길이에 대한 시계 아이콘이 있는 레이블을 추가
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    // 스페이서를 추가하고 회의 길이 값을 텍스트 보기에 표시
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                // 접근성 사용자를 위해 Label 및 Text 요소를 결합하기 위해 AccessibilityElement(children:)를 HStack에 추가
                .accessibilityElement(children: .combine)
                HStack {
                    // 스크럼 카드 테마에 대한 페인트 팔레트 아이콘이 있는 레이블을 추가
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                    // 패딩, 전경색 및 배경색, 모서리 반경을 추가하여 텍스트 뷰의 스타일을 지정
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            // ForEach를 추가하여 참석자 목록을 동적으로 생성하고 scrum.attendees를 데이터로 전달
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    // ForEach를 추가하여 참석자 목록을 동적으로 생성하고 scrum.attendees를 데이터로 전달
                    // 사람 아이콘이 있는 참석자 이름을 표시하려면 레이블을 추가
                    Label(attendee.name, systemImage: "person")

                }
            }
        }
        // List에 .navigationTitle(scrum.title)을 설정하여 스크럼 제목을 표시
        .navigationTitle(scrum.title)

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        // 미리보기 공급자에서 스크럼 데이터로 DetailView를 초기화
        // NavigationView에서 DetailView를 래핑하여 캔버스에서 탐색 요소
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
