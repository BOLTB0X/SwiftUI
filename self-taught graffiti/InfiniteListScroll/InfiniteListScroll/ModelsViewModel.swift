//
//  ModelsViewModel.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import SwiftUI
import Combine

// MARK: 뷰모델
class ModelsViewModel: ObservableObject {
    @Published private(set) var cur = currentState()
    private var subscriptions = Set<AnyCancellable>()
    
    // MARK: 다음 목록들 불러오기 체크 메소드
    func fetchNextPossible() {
        guard cur.LoadNextPage else { return }
        
        // 현재 API 쿼리문에 맞춰 가져올 메소드의 매개변수에 셋팅
        // API 따라 쿼리나 파라미터들이 변경됨
        APIDemoManager.fetchURL(query: "swift", page: cur.page)
        // sink로 subscriber와 publisher 연결
            .sink(receiveCompletion: onReceive,
                  receiveValue: onReceive)
            .store(in: &subscriptions)
    }
    
    // MARK: onReceive
    
    // 완료 = 받아오는 경우 성공, 실패를 나눔
    private func onReceive(_ completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break;
        case .failure:
            cur.LoadNextPage = false
        }
    }
    
    // value를 받아옴
    private func onReceive(_ batch: [APIRequest]) {
        cur.model += batch
        cur.page += 1
        cur.LoadNextPage = batch.count == APIDemoManager.pageSize ? true : false
    }
}
