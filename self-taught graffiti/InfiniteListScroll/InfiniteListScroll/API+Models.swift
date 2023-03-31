//
//  API+Models.swift
//  InfiniteListScroll
//
//  Created by KyungHeon Lee on 2023/03/31.
//

import Foundation
import Combine

// MARK: API 요청
// 사용할 API
// 여기서 요청
class APIDemoManager {
    static let pageSize = 10
    
    // alamofire에서 제공하는 request의 반환 값인 DataRequest
    static func fetchURL(query: String, page: Int) -> AnyPublisher<[APIRequest], Error> {
        let url = URL(string: "https://api.github.com/search/repositories?q=\(query)&sort=stars&per_page=\(Self.pageSize)&page=\(page)")!
        
        return URLSession.shared
            .dataTaskPublisher(for: url) // URL 세션 데이터 작업을 래핑하는 게시자를 만들어줌
        // 응답을 APIResult로 디코딩
        // JSON 파싱을 목적으로 생성된 중간 유형
            .tryMap{ try JSONDecoder()
                        .decode(APIResponse<APIRequest>.self, from:$0.data).items }
            .receive(on: DispatchQueue.main) // 3. 메인 스레드에서 응답을 받음
            .eraseToAnyPublisher()
    }
}

// MARK: API요청으로 인한 응답
struct APIResponse<T: Codable>: Codable {
    let items: [T]
}

// MARK: API요청
struct APIRequest: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int
    
    // 미리보기를 위한 더미
    static func getDummy() -> Self {
        return APIRequest(id: 0, name: "sdgdsfgds", description: "AfdsfasDFSS", stargazers_count: 5)
    }
}

// MARK: 현재 상태를 나타내는 모델
// ViewModel에 연결할 모델
struct currentState {
    var model: [APIRequest] = []
    var page: Int = 1
    var LoadNextPage: Bool = true
}

