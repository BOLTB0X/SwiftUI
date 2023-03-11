/*
See LICENSE folder for this sample’s licensing information.
*/

import Foundation

struct DailyScrum: Identifiable {
    let id: UUID
    var title: String
    var attendees: [Attendee]

    var lengthInMinutes: Int
    var theme: Theme
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }
        // map(_:)은 기존 컬렉션의 각 요소를 반복하고 변환을 적용하여 새 컬렉션을 만듭
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

// 식별 가능한 Attendee라는 내부 구조로 확장
extension DailyScrum {
    struct Attendee: Identifiable {
        // 필요한 id 속성과 이름에 대한 변수를 추가
        let id: UUID
        var name: String
        
        // id 속성에 기본값을 할당하는 초기화 프로그램을 추가
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
}
