//
//  ContentView.swift
//  EscapingJSON
//
//  Created by KyungHeon Lee on 2023/03/30.
//

import SwiftUI

// 웹데이터를 앱에서 사용할 수 있는 데이터로 변환하고 그 API를 화면에 띄워주는것이 목표
struct ContentView: View {
    @StateObject var vm = RefaDownloadWithEscapingViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.posts) { post in
                    VStack(alignment: .leading, spacing: 10) {
                        Text(post.title)
                            .font(Font.title.bold())
                        Text(post.body)
                            .foregroundColor(Color(UIColor.systemRed))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .navigationBarTitle("Fack API DATA")
            .listStyle(PlainListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
