//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by KyungHeon Lee on 2023/03/05.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        // ZStack은 뷰를 뒤에서 앞으로 오버레이하고, RoundedRectangle은 배경 역할을 하며 그 아래에 나열된 뷰 뒤에 나타냄
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            // 텍스트 보기를 테마 이름과 페인트 팔레트 시스템 이미지를 표시하는 레이블로 바꿉
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }
        // ZStack의 전경색을 테마의 강조색으로 설정하고 세로 크기를 레이블의 고유 크기와 일치시킴
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)
    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
