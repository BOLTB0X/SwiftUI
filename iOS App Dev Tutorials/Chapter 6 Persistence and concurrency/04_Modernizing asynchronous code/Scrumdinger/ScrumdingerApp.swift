/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    // ScrumdingerApp.swift에서 목록 보기의 saveAction 클로저에 있는 ScrumStore.save()에 대한 호출을 새 작업으로 바꿉
                    // 작업은 ScrumStore.save()를 호출하는 데 사용할 새 비동기 컨텍스트를 생성
                    Task {
                        do { // ScrumStore.save()를 호출
                            // discardableResult 특성이 저장 함수에 주석을 달기 때문에 반환 값을 무시할 수 있음
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            // catch 절에서 fatalError(_:)를 호출
                            // SwiftUI는 비동기 작업을 보기와 연결하는 데 사용할 수 있는 작업 수정자를 제공
                            // 시스템이 내비게이션 뷰를 생성할 때 수정자를 사용하여 스크럼을 로드
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
//            .task 변경
            .task {
                // do 절에서 ScrumStore.load()를 호출
                do {
                    // 스크럼을 함수가 반환하는 값으로 설정
                    // 대기 중인 기능이 완료되면 scrums에 새 값이 할당 됌
                    // 스크럼은 게시된 속성이므로 속성이 업데이트되면 ScrumStore를 관찰하는 모든 보기가 새로 고쳐짐
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
