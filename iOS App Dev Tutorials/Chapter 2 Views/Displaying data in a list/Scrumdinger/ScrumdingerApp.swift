/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup { // WindowGroup은 SwiftUI가 제공하는 기본
            // iOS에서 WindowGroup 씬 빌더에 추가한 뷰는 장치의 전체 화면을 채우는 창에 표시
            // ScrumdingerApp.swift를 열고 ScrumsView를 앱의 초기 보기로 설정
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
