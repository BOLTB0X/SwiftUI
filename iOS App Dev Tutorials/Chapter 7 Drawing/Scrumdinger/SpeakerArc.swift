//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/20.
//

import SwiftUI

// 이 섹션에서는 한 화자의 시간을 나타내는 원의 일부를 추적하는 단일 호 세그먼트를 만듭니다. 이 호는 참석자 간의 회의 진행 상황을 설명하기 위해 여러 개의 호 세그먼트를 그리는 다음 섹션의 빌딩 블록 역할을 합니다.
// 즉 호로 진행률을 나타냄
struct SpeakerArc: Shape {
    // speakerIndex 및 totalSpeakers에 대한 상수 프로퍼티을 추가
    let speakerIndex: Int // 먼트 수를 결정합니다. 발언자 인덱스는 발언 중인 참석자와 그릴 세그먼트 수를 나타냄
    let totalSpeakers: Int // 총 화자 수를 기반으로 아크 세그먼트 수를 결정
    
    // 전용 계산 속성 degreesPerSpeaker를 추가
    //
    private var degreesPerSpeaker: Double {
        360.0 / Double(totalSpeakers) // totalSpeakers를 사용하여 단일 호의 각도를 계산
    }
    
    // startAngle이라는 프라이빗 계산 프로퍼티을 추가하고 degreesPerSpeaker 및 speakerIndex를 사용하여 값을 계산
    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    // startAngle 및 degreesPerSpeaker를 사용하여 끝 각도를 반환하는 endAngle이라는 개인 계산 프로퍼티을 추가
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    // Shape 프로토콜에는 path(in:) 함수가 필요
    // 컴파일러는 다음 단계에서 해당 함수를 추가할 때까지 오류를 생성
    func path(in rect: CGRect) -> Path { // Path 이니셜라이저는 경로 매개변수를 전달하는 클로저
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)

        // 빈 경로를 반환하는 path(in:) 함수를 추가
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
