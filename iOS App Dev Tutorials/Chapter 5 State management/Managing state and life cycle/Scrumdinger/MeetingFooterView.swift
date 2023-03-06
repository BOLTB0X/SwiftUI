//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/06.
//

import SwiftUI

struct MeetingFooterView: View {
    // [ScrumTimer.Speaker] 유형의 스피커 속성을 추가
    let speakers: [ScrumTimer.Speaker]
    // skipAction 클로저 속성을 보기에 추가
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        // 스피커 번호를 결정하는 개인 계산 속성을 추가
        // ScrumTimer는 각 발표자의 시간이 끝나면 완료된 것으로 표시
        // 완료로 표시되지 않은 첫 번째 발언자가 활성 발언자가
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil}
        return index + 1 // speakerNumber 속성은 인덱스를 사용하여 바닥글 텍스트의 일부로 사용할 현재 발언자 번호를 반환합
    }
    
    // 현재 발언자가 마지막 발언자인지 확인하는 개인 계산 속성을 추가
    // 이 속성은 마지막 화자를 제외한 각 화자의 isCompleted 속성이 true인 경우에 true
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    // 활성 화자에 대한 정보를 반환하는 개인 계산 속성을 추가하고 텍스트 보기에 전달
    // 남은 발언자가 있는 경우 속성은 발언자 X/Y를 반환하거나 회의가 할당된 시간을 초과하면 발언자 없음을 반환
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }

    var body: some View {
        // VStack에 HStack을 래핑하고 활성 발언자가 마지막 발언자일 때 Text("마지막 발언자")를 표시하는 if 문을 추가
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else { // 나머지 본문을 else 문으로 래핑
                    Text(speakerText)
                    Spacer()
                    // skipAction을 사용하도록 버튼 동작을 업데이트
                    Button(action: skipAction) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        // 미리 보기에서 DailyScrum.attendees의 스피커 속성을 사용하여 MeetingFooterView 초기화 프로그램에 스피커 배열을 전달
        // MeetingFooterView 이니셜라이저에 전달
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction: {})
            .previewLayout(.sizeThatFits)            .previewLayout(.sizeThatFits)
    }
}
