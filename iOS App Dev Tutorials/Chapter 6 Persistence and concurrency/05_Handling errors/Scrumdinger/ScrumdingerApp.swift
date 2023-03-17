/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    // ScrumdingerApp.swift에서 errorWrapper라는 선택적 상태 변수를 추가
    @State private var errorWrapper: ErrorWrapper?

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            // 치명적인 오류 호출을 새 errorWrapper에 대한 할당으로 바꿈
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    // 치명적인 오류 호출을 새 errorWrapper에 대한 할당으로 바꿈
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            // 오류 래퍼 항목에 바인딩이 있는 시트를 추가
            // 모달 시트는 사용자가 모달 시트를 닫을 때 코드를 실행하는 클로저와 모달로 표시할 뷰를 제공하는 클로저를 제공
            .sheet(item: $errorWrapper, onDismiss: {
                // onDismiss 클로저에서 스크럼 배열에 샘플 데이터를 할당
                store.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)

            }
        }
    }
}
