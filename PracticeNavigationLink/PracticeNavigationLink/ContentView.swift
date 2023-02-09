//
//  ContentView.swift
//  PracticeNavigationLink
//
//  Created by KyungHeon Lee on 2023/02/09.
//

import SwiftUI

struct ResultView: View {
    var number: String
    
    var body: some View {
        if number == "1" {
            Text("One")
        } else {
            Text("Two")
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("1번과 2번 중에서\n 하나만 고르셈")
                    .multilineTextAlignment(.center)
                
                
                NavigationLink(destination: ResultView(number: "1")) {
                    Text("1번")
                        .foregroundColor(Color.gray)
                }
                
                NavigationLink(destination: ResultView(number: "2")) {
                    Text("2번")
                        .foregroundColor(Color.gray)
                }
            }
            .navigationBarTitle("선택하셈")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
