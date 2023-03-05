/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct DetailView: View {
    // 파일 맨 위에서 scrum 상수를 변수 바인딩으로 변환
    // 바인딩을 사용하면 사용자의 상호 작용이 스크럼을 수정할 때 DetailView가 다시 렌더링
    @Binding var scrum: DailyScrum

    // add
    @State private var data = DailyScrum.Data()

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
                // 편집 버튼의 액션 클로저에서 데이터를 scrum.data로 설정
                data = scrum.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                // 데이터 바인딩을 포함하도록 DetailEditView 이니셜라이저를 업데이트
                // 사용자가 편집 보기에서 데이터를 변경하면 세부 Previews의 데이터 속성과 공유
                DetailEditView(data: $data)
                .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                // 파일 하단에서 Done 버튼의 클로저에서 scrum.update(from: data)를 호출
                                scrum.update(from: data)

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
            // DetailView_Previews의 DetailView 이니셜라이저에 대한 상수 바인딩을 전달
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))

        }
    }
}
