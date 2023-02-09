//
//  ContentView.swift
//  PracticeNavigationView
//
//  Created by KyungHeon Lee on 2023/02/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // List 이용
            List(1..<101) { row in
                NavigationLink(destination: Text(" 내용 \(row)")) {
                        Text("\(row) 번")
                        }
                        
                    }
                    // 타이틀은 항상
                    // NavigationView가 닫기 전에
                    .navigationBarTitle("문제")
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
