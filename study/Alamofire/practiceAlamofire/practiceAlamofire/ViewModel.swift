//
//  ViewModel.swift
//  practiceAlamofire
//
//  Created by KyungHeon Lee on 2023/03/22.
//

import Foundation
import Alamofire

class ViewModel: ObservableObject {
    @Published var randomUser = [RandomUser]()
    
    // MARK: URL 연결
    func alamofireNetworking(url: String) {
        // MARK: URL 생성, guard let 으로 옵셔널 검시
        guard let sessionURL = URL(string: url) else {
            print("Invalid URL")
            return
        }
        
        // MARK: Request 생성
        AF.request(sessionURL,
                   method: .get,
                   parameters: nil,
                   encoding: URLEncoding.default,
                   headers:  ["Content-Type":"application/json", "Accept":"application/json"]) // 헤더 설정
        .validate(statusCode: 200..<300) // 유효성 검사
        
        // MARK: responseDecodable을 통해 UserDatas form으로 디코딩, response의 성공 여부에 따라 작업 분기
        .responseDecodable(of: UserDatas.self) { response in
            switch response.result {
            case .success(let value):
                self.randomUser = value.results
            case .failure(let error):
                print(error)
            }
        }
    }
}
