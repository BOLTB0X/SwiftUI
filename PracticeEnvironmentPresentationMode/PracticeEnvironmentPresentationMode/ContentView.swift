//
//  ContentView.swift
//  PracticeEnvironmentPresentationMode
//
//  Created by KyungHeon Lee on 2023/02/09.
//

import SwiftUI

// Environment presentationMode
// Back버튼을 hidden으로 해놓고 따로 버튼을 만들어서 그 버튼을 누르면 메인화면으로 돌아갈 수 있도록 만들어 주는 게 가능
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("Environment presentationMode\n")
            .navigationBarTitle("사람을 눌러라")
            // 숨기기
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        // 여기로 아동
                        destination: secondView(),
                        label: {
                            Image(systemName: "person.fill")
                                .foregroundColor(.orange)
                        })
            )
        }
    }
}

// navigationLink로 넘어간 View에서 지워줘야함
struct secondView: View {
    // 이거 필수
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // 싹다 채우기
            Color.orange.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            
            // 기존 Back 버튼 숨기기
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                // X 버튼으로 변경
                Image(systemName: "xmark")
                    .imageScale(.large)
                    .padding()
            })
            .accentColor(.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
