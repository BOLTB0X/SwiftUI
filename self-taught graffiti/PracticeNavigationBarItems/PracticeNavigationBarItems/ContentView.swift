//
//  ContentView.swift
//  PracticeNavigationBarItems
//
//  Created by KyungHeon Lee on 2023/02/10.
//

import SwiftUI

// NavigationBarItems
// 종류는 automatic / inline / large
struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("쓸말이 없어요")
                .navigationBarTitle("UI", displayMode: .inline) // .inline은 센터
                
                // Items 활용 방법
                .navigationBarItems(leading:
                                        HStack {
                    Button("Item은") { /*code*/  }
                    Button("이렇게")
                    { /*code*/ }
                },trailing:
                    HStack {
                        Button("요렇게도") { /*code*/ }
                        Button("가능") { /*code*/ }
                    }
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
