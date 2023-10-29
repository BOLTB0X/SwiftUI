//
//  TwoDigitTextField.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI

struct TwoDigitInputView: View {
    @State private var text: String = "43"
    @State private var isEditing: Bool = false

    var body: some View {
        VStack {
            TextEditor(text: $text)
                .background(
                    Color.clear
                        .onTapGesture {
                            // 클릭할 때 키보드를 띄웁니다.
                            isEditing = true
                        }
                )
                .onAppear {
                    // 화면이 나타날 때 텍스트를 편집 모드로 변경합니다.
                    isEditing = true
                }
                .opacity(0)
                .keyboardType(.default)
            
            if isEditing {
                TextField("Type here", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
//                    .onTapGesture {
//                        isEditing = true
//                    }
            }
        }
    }
}
#Preview {
    TwoDigitInputView()
}
