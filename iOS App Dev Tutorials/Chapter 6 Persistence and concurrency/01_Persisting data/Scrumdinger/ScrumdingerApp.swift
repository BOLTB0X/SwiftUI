/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

@main
struct ScrumdingerApp: App {
    // scrums라는 @State 속성을 store라는 @StateObject 속성으로 변경
    // store의 값을 ScrumStore()로 설정
    // @StateObject 속성 래퍼는 개체를 선언하는 구조의 각 인스턴스에 대해 관찰 가능한 개체의 단일 인스턴스
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                // store.scrums에 대한 바인딩 전달
                // saveAction 클로저의 ScrumStore.saveScrums()를 호출
                ScrumsView(scrums: $store.scrums) {
                    ScrumStore.save(scrums: store.scrums) { result in
                        // 호출 결과가 실패하면 오류를 로컬 상수에 바인딩하고 실행을 중지
                        // 현재 데이터를 디스크에 유지하는 동안 오류가 발생하면 앱이 충돌
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            // NavigationView에 onAppear 수정자를 추가하고 수정자의 액션 클로저에서 ScrumStore.load를 호출
            .onAppear {
                ScrumStore.load { result in
                    // switch 문을 사용하여 스토어의 스크럼 배열을 디코딩된 데이터로 업데이트하거나
                    // load(completion:)이 오류를 반환하는 경우 실행을 중단
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let scrums):
                        store.scrums = scrums
                    }
                }
            }
        }
    }
}
