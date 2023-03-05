/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ScrumsView: View {
    // scrums constant to a binding.
    @Binding var scrums: [DailyScrum]

    var body: some View {
        List {
            // Binding<[DailyScrum]>을 허용하도록 ForEach 수정
            // 클로저 매개변수 유형을 Binding<DailyScrum>으로 변경
            // $ 접두사는 래핑된 속성의 예상 값에 액세스합니다. 스크럼 바인딩의 예상 값은 또 다른 바인딩
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
        }
        .navigationTitle("Daily Scrums")
        .toolbar {
            Button(action: {}) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            // ScrumsView_Previews, ScrumsView 초기자에 상수 바인딩을 전달
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}

