//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/05.
//

import SwiftUI

struct ThemePicker: View {
    // selection이라는 테마에 대한 바인딩
    @Binding var selection: Theme

    var body: some View {
        // 제목이 "Theme"인 선택기를 추가하고 선택 바인딩을 전달
        Picker("Theme", selection: $selection) {
            // ThemePicker.swift에서 ForEach를 추가하여 Theme의 모든 사례를 나열
            ForEach(Theme.allCases) { theme in
                // ThemeView를 추가하고 테마로 태그를 지정
                // 선택기 및 목록과 같은 컨트롤에서 구분해야 하는 경우 하위 보기에 태그를 지정할 수 있음
                // 태그 값은 열거형과 같이 해시 가능한 모든 유형이 될 수 있음
                ThemeView(theme: theme)
                    .tag(theme)
            }
 
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        // 상수 바인딩을 전달하여 미리보기에서 테마 선택기를 초기화
        // 상수(_:) 유형 메서드를 사용하여 하드 코딩된 불변 값에 대한 바인딩을 만들 수 있음
        // 상수 바인딩은 미리보기나 앱의 UI 프로토타입을 만들 때 유용
        ThemePicker(selection: .constant(.periwinkle))
    }
}
