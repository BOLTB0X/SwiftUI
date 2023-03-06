/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct MeetingView: View {
    // scrum binding 변수 추거
    @Binding var scrum: DailyScrum
    // MeetingView.swift에서 @StateObject인 scrumTimer 속성을 추가
    // 프로퍼티를 @StateObject로 감싸는 것은 뷰가 객체에 대한 정보 소스를 소유한다는 것을 의미
    // @StateObject는 ObservableObject인 ScrumTimer를 MeetingView 수명 주기에 연결
    @StateObject var scrumTimer = ScrumTimer()

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                // secondsElapsed 및 secondsRemaining 인수를 제공하기 위해 scrumTimer를 사용하는 회의 헤더 하위 보기에 대한 호출을 추가
                
                // MeetingView.swift에서 MeetingFooterView에 대한 호출을 추가
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)

                Circle()
                    .strokeBorder(lineWidth: 24, antialiased: true)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)

            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        // onAppear 한정자를 추가하고 scrumTimer.reset을 호출하여 길이(분)와 참석자를 전달
        // 타이머는 MeetingView 인스턴스가 화면에 표시될 때마다 재설정되어 회의가 시작되어야 함을 나타남
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            // 타이머가 재설정된 후 새 스크럼 타이머를 시작하려면 scrumTimer.startScrum()을 호출
            scrumTimer.startScrum()

        }
        // onDisappear 수정자를 추가하고 scrumTimer.stopScrum()을 호출
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
