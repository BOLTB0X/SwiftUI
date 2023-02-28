//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/01.
//

import SwiftUI

// 사용자 지정 레이블 스타일을 만들지 않으려면 시스템 표준 레이아웃을 사용하여 아이콘, 제목 또는 둘 다 표시하는 기본 제공 레이블 스타일 중 하나를 사용
struct TrailingIconLabelStyle: LabelStyle {
    // 시스템은 이 스타일이 현재 레이블 스타일인 보기 계층 구조의 각 Label 인스턴스에 대해 이 메서드를 호출
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            // HStack 내부에 configuration.title 및 configuration.icon을 추가
            // 구성 매개변수는 아이콘 및 제목 보기를 포함하는 LabelStyleConfiguration
            configuration.title
            configuration.icon
        }
    }
}

// trailingIcon이라는 정적 속성을 만드는 LabelStyle에 확장을 추가
// 레이블 스타일을 정적 속성으로 정의했으므로 선행 점 구문을 사용하여 호출할 수 있으므로 코드를 더 쉽게 읽을 수가 있음
extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
