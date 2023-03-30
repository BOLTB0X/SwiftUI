//
//  Model.swift
//  EscapingJSON
//
//  Created by KyungHeon Lee on 2023/03/30.
//

import Foundation

import Foundation

// MARK: Model

// GET의 /posts/1 이용
// JSON배열이 userID, id, title, body
// get post의 Json 데이터와 동일한 모델 생성
// postModel을 디코딩하고 인코딩을 원하기 때문에 codable 프로토콜 추가

struct PostModel: Identifiable, Codable {
    let userID: Int
    let id: Int
    let title: String
    let body: String
    
    // CodingKeys는 json key가 아닌 본인이 원하는 이름으로 지정해줄 수 있게 해주는 프로토콜
    // 위 구조체에 선언한 프로퍼티랑 json key와 같다면 enum의 case에 작성만 하면 됌
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

// 여기서 JSON Data 구조를 struct Model로 가져올 때 정확하지 않고 한 개 라도 잘못 입력한다면 컴파일 오류발생
