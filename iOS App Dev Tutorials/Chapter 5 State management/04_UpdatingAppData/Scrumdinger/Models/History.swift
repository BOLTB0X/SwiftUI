//
//  History.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/07.
//

import Foundation

// 회의 날짜 및 길이, 참석자 목록과 같은 스크럼 세션의 필수 세부 정보를 저장하기 위한 properties
struct History: Identifiable {
    let id: UUID
    let date: Date
    var attendees: [DailyScrum.Attendee]
    var lengthInMinutes: Int
    
    // 각 속성에 대한 기본 매개변수를 제공하는 초기화 프로그램을 만듬
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee], lengthInMinutes: Int = 5) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
    }
}
