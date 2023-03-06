//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/06.
//

import SwiftUI

// ProgressView, "Seconds Elapsed" VStack, "Seconds Remaining" VStack 및 MeetingView.swift의 접근성 데이터를 MeetingHeaderView 본문으로 이동
struct MeetingHeaderView: View {
    // secondsElapsed 및 secondsRemaining에 대한 속성을 만들고 미리 보기의 이니셜라이저에 새 인수를 전달
    let secondsElapsed: Int
    let secondsRemaining: Int
    
    // secondsElapsed 및 secondsRemaining을 추가하는 totalSeconds라는 프라이빗 계산 속성을 추가
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    // 진행률을 계산하는 개인 계산 속성을 추가하고 계산 속성을 ProgressView에 전달
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    // secondsRemaining 값을 사용하여 minutesRemaining을 계산하는 계산 속성을 추가
    // VoiceOver 사용자에게는 진행률 보기 또는 진행률 링의 시각적 참조가 없기 때문에 초에서 분으로의 변환을 계산하고 가장 관련성이 높은 데이터인 남은 시간(분)을 표시
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    var body: some View {
        // 최상위 VStack을 생성하고 접근성 수정자를 HStack에서 VStack으로 이동
        VStack {
            ProgressView(value: progress)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                    // 레이블 제목을 secondsElapsed 및 secondsRemaining 값으로 바꿈
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")

                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.fill")
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        // .accessibilityValue에서 정적 데이터를 제거하고 텍스트를 업데이트하여 남은 시간을 읽음
        .accessibilityValue("\(minutesRemaining) minutes")
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        // .previewLayout(.sizeThatFits)으로 미리보기를 수정하여 캔버스에서 하위 보기 크기를 더 정확하게 나타낼 수 있음
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180)
            .previewLayout(.sizeThatFits)
    }
}
