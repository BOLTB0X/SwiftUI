//
//  ContentView.swift
//  OnTapGesture
//
//  Created by KyungHeon Lee on 2023/05/09.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.gray, .red, .orange, .yellow,
                           .green, .blue, .purple, .pink]
    @State private var fgColor: Color = .gray

    var body: some View {
        VStack {
            Image(systemName: "doc.text.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundColor(fgColor)
                .onTapGesture(count: 2) { // 두 번 클릭하거나 탭할 때마다 색상 배열에서 임의의 색상으로 변경
                    fgColor = colors.randomElement()!
                }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
