//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/02.
//

import SwiftUI

struct DetailEditView: View {
    // @State 속성 래퍼는 값 유형에 대한 진실의 출처를 정의
    // @State 속성을 정의한 보기 내에서만 액세스할 수 있도록 비공개로 선언
    @State private var data = DailyScrum.Data()
    // @State 속성을 추가
    // newAttendeeName 속성은 사용자가 입력하는 참석자 이름을 보유
    @State private var newAttendeeName = ""


    var body: some View {
        Form {
            // 텍스트 보기를 양식으로 바꾸고 "회의 정보" 헤더가 있는 섹션을 추가
            // 양식 컨테이너는 다른 플랫폼에서 렌더링될 때 컨트롤의 모양을 자동으로 조정
            Section(header: Text("Meeting Info")) {
                // TextField는 문자열에 대한 바인딩을 사용
                // $ 구문을 사용하여 data.title에 대한 바인딩을 만들 수 있고 현재 보기는 데이터 속성의 상태를 관리
                TextField("Title", text: $data.title)
                // 회의 길이에 대한 HStack 및 슬라이더를 추가
                // 슬라이더의 레이블 클로저에서 접근성 사용을 위한 텍스트 보기를 추가
                // Slider는 지정한 연속 범위에서 Double을 저장
                // step 1을 전달하면 사용자가 정수를 선택하도록 제한
                // 텍스트 보기는 화면에 나타나지 않지만 VoiceOver는 이를 사용하여 슬라이더의 목적을 식별
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(data.lengthInMinutes)) minutes")
                }
            }
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }
                // onDelete 수정자를 추가하여 스크럼 데이터에서 참석자를 제거
                // 프레임워크는 사용자가 행을 삭제하기 위해 스와이프할 때 onDelete에 전달하는 클로저를 호출
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                // TextField를 포함하는 HStack을 추가하고 바인딩을 newAttendeeName 속성에 전달
                // 바인딩은 newAttendeeName을 텍스트 필드의 내용과 동기화 상태로 유지
                // 원본 DailyScrum 모델 데이터에는 영향 X
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
