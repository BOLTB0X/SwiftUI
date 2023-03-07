/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    
    // ScrumsView.swift에서 isPresentingNewScrumView라는 @State 속성을 추가
    // isPresentingNewScrumView 속성은 새 스크럼을 만들기 위해 편집 보기의 프레젠테이션을 제어 함
    @State private var isPresentingNewScrumView = false
    // 기본값이 DailyScrum.Data()인 newScrumData라는 @State 속성을 추가
    // newScrumData 속성은 사용자가 새 스크럼에 대해 수행하는 모든 변경 사항에 대한 정보 소스
    @State private var newScrumData = DailyScrum.Data()


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
                // isPresentingNewScrumView를 true로 변경하면 앱이 시트를 표시
                isPresentingNewScrumView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        // Sheet(momal) 추가
        .sheet(isPresented: $isPresentingNewScrumView) {
            // NavigationView 내부에 DetailEditView를 추가
            NavigationView {
                // DetailEditView는 newScrumData에 대한 바인딩을 사용하지만 ScrumsView의 @State 속성은 정보 소스를 유지
                DetailEditView(data: $newScrumData)
                // 닫기 및 추가 단추가 있는 도구 모음을 DetailEditView에 추가
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewScrumView = false
                                // 사용자가 시트를 해제하면 newScrumData를 초기화
                                newScrumData = DailyScrum.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                // 추가 단추 작업에서 newScrumData를 사용하여 새 DailyScrum을 만듬
                                // newScrumData의 속성은 DetailEditView의 컨트롤에 바인딩되며 사용자가 설정한 현재 정보를 갖음
                                // crums 배열에는 DailyScrum의 요소가 포함되어 있으므로 배열에 삽입할 새 DailyScrum을 생성
                                let newScrum = DailyScrum(data: newScrumData)
                                // scrums 배열에 newScrum을 추가
                                // scrums 배열은 바인딩이므로 이 뷰에서 배열을 업데이트하면 앱에 포함된 소스가 업데이트
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                // newScrumData를 재설정하면 사용자가 추가 버튼을 다시 누르면 이전 수정 사항이 표시 X
                                newScrumData = DailyScrum.Data()
                            }
                        }
                    }
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}

