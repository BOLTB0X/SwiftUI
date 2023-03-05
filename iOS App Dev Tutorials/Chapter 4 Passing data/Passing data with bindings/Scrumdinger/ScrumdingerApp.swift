/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App {
    // @State property named scrums 추가
    @State private var scrums = DailyScrum.sampleData

    var body: some Scene {
        WindowGroup {
            NavigationView {
                // 스크럼에 대한 바인딩을 ScrumsView initializer에 전달
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
