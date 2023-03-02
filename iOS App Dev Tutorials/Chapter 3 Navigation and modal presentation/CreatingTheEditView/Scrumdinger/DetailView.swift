/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    let scrum: DailyScrum
    
    // DetailView.swift에서 isPresentingEditView라는 @State 속성을 추가
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(destination: MeetingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
            }
        }
        // 목록에 시트 수정자를 추가
        // sPresentingEditView가 true로 변경되면 앱은 기본 콘텐츠를 부분적으로 덮는 모달 시트를 사용하여 DetailEditView를 표시
        // 모달 보기는 앱의 기본 탐색 흐름에서 사용자를 제거
        // 짧고 독립적인 작업에 양식을 사용
        // 다양한 유형의 모달 프레젠테이션과 앱에서 모달을 효과적으로 사용하는 경우에 대한 자세한 내용은 휴먼 인터페이스 지침의 모달을 참조
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                // 스크럼 세부 정보에 대한 변경 사항을 취소하고 있음을 사용자에게 나타내는 도구 모음 버튼을 추가
                // 취소 버튼 동작에서 DetailEditView를 닫음
                DetailEditView()
                    .navigationTitle(scrum.title)
                // 사용자에게 변경 사항을 저장하고 있음을 나타내는 도구 모음 버튼을 추가
                // 완료 버튼 동작에서 DetailEditView를 닫음
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                            }
                        }
                    }

            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
