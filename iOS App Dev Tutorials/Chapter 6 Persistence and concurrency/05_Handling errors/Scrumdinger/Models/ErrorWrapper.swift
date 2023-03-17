//
//  ErrorWrapper.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/17.
//

import Foundation

// 식별 가능한 프로토콜을 준수하는 ErrorWrapper라는 구조
struct ErrorWrapper: Identifiable {
    let id: UUID // 식별 가능한 프로토콜에는 고유 ID 속성을 포함해야 함
    // 오류 프로토콜 및 지침 문자열 속성을 준수하는 오류 속성을 추가
    // Error 프로토콜을 사용하여 오류 처리 속성에 유형을 명시적으로 할당할 수 있음
    let error: Error
    // Scrumdinger는 관련 오류가 발생하면 안내 문자열을 표시
    let guidance: String
    
    // 오류 및 지침 문자열을 수락하고 id에 대한 기본값을 할당하는 init
    init(id: UUID = UUID(), error: Error, guidance: String) {
        // 이 이니셜라이저는 다음 섹션에서 만들 오류 보기에 미리 보기 데이터를 제공
        self.id = id
        self.error = error
        self.guidance = guidance
    }
}
