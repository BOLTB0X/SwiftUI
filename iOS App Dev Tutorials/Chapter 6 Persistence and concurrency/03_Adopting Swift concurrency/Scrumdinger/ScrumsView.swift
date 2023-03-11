/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    // scenePhase 값에 대한 @Environment 속성을 추가
    // 이 값을 관찰하고 비활성화되면 사용자 데이터를 저장
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    // saveAction 속성을 추가하고 미리보기에서 빈 작업을 전달
    let saveAction: ()->Void
    
    
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
            // scenePhase 값을 관찰하는 onChange 수정자를 추가
            // onChange(of:perform:)을 사용하여 지정된 값이 변경될 때 작업을 트리거 가능
        }.onChange(of: scenePhase) { phase in
            // scene 비활성 단계로 이동하는 경우 saveAction()을 호출
            // 비활성 단계의 장면은 더 이상 이벤트를 수신하지 않으며 사용자가 사용하지 못할 수 있음
            if phase == .inactive { saveAction() }

        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            // ScrumsView를 인스턴스화할 때 saveAction 클로저를 제공
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
        }
    }
}

