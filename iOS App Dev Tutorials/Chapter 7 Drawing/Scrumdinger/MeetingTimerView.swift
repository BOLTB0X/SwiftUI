//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/20.
//

import SwiftUI

// 회의 진행 상황과 현재 발표자의 이름을 시각화하기 위해 원을 기반으로 하는 MeetingTimerView
struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    // currentSpeaker라는 계산된 프로퍼티을 추가
    private var currentSpeaker: String {
        // 현재 화자가 없으면 "Someone" 반환
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        Circle()
        // MeetingView에서 원형 보기를 잘라 MeetingTimerView에 붙여넣음
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    // "is speak"를 표시하는 텍스트 보기를 추가하고 두 텍스트 보기를 모두 VStack으로 래핑
                    Text(currentSpeaker)
                        .font(.title)
                    Text("is speaking")
                }
                // VStack 내부의 요소를 결합
                // VoiceOver가 두 개의 텍스트 보기를 하나의 문장으로 읽도록 함
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay  {
                ForEach(speakers) { speaker in
                    // 화자가 끝났는지 확인하고 선택적 바인딩을 사용하여 화자의 인덱스를 찾는 if 문을 추가
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                        // 스피커 호를 -90도 회전시키는 회전 수정자를 추가
                        // 호를 회전하면 0도 각도가 12시 위치로 이동
                            .rotation(Angle(degrees: -90))
                            .stroke(theme.mainColor, lineWidth: 12)
                        // theme.mainColor 및 선 너비 12를 전달하는 획 수정자를 추가

                    }
                }
            }
            .padding(.horizontal)
    }
}

struct MeetingTimerView_Previews: PreviewProvider {
    // 테마 및 스피커 프로퍼타 추가
    // 샘플 화자 데이터의 정적 배열은 화자 목록 UI를 개발하는 동안 유용
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
}
