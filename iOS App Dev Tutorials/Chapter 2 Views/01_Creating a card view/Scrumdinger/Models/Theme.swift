//
//  Theme.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/02/26.
//

// 뷰를 생성하지 않더라도 SwiftUI 프레임워크에서 Color 속성을 추가하도록 공식문서는 권유
// SwiftUI는 뷰 계층 구조에 직접 추가할 수 있는 뷰 인스턴스로 색상을 처리하기 때문
import SwiftUI

// Swift는 테마의 각 케이스 이름에서 문자열을 자동으로 생성
// 열거형에 원래 유형을 선언하는 경우가 있어야 하므로 컴파일러에서 오류가 발생
enum Theme: String {
    // Assets 카탈로그의 Themes 폴더에 나열된 각 색상에 대한 케이스를 추가하므로
    // Assets 카탈로그의 명명된 색상은 코드의 해당 참조와 일치해야 하므로 각 대소문자의 철자가 올바른지 확인해야 함
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    // self 값에 따라 .black 또는 .white를 반환하는 accentColor라는 Color 속성을 추가
    // 강조 색상은 테마의 기본 색상에 대한 고대비 보완을 제공하여 보기에 계속 액세스할 수 있도록 해주는 거임
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    // 열거형의 rawValue를 사용하여 색상을 생성하는 mainColor라는 Color 속성을 추
    // 색상을 초기화
    var mainColor: Color {
        Color(rawValue)
    }
}
