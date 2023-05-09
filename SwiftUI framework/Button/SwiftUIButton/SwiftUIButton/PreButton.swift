//
//  PreButton.swift
//  SwiftUIButton
//
//  Created by KyungHeon Lee on 2023/05/09.
//

import SwiftUI

struct PreButton: View {
    var body: some View {
        VStack {
            Button(action: {
                print("삭제 클릭")
            }) {
                HStack {
                    Image(systemName: "trash")
                        .font(.title)
                    Text("Delete")
                        .fontWeight(.semibold) // 폰트의 두께
                        .font(.title) // 폰트 변경
                }
                .padding() // 간격
                .foregroundColor(.white) // 글씨 색깔
                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))

//                .background(Color.green) // 버튼 범위에
                .cornerRadius(40) // 모서리를 둥글게
            }
            Spacer()
        }
    }
}

struct PreButton_Previews: PreviewProvider {
    static var previews: some View {
        PreButton()
    }
}
