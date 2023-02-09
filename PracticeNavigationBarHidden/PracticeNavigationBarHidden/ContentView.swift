//
//  ContentView.swift
//  PracticeNavigationBarHidden
//
//  Created by KyungHeon Lee on 2023/02/10.
//

import SwiftUI

// navigationBarHidden
// title 가리기 가능
struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                Image(systemName: "person.fill")
                Text("사람이 있어요")
                    .navigationTitle("NavigationBarHidden")
                // true이면 사라짐
                    //.navigationBarHidden(true)
                    
                // back 버튼 사라지기 가능
                    .navigationBarItems(trailing: NavigationLink(destination:     Text("못나가지")            .navigationBarBackButtonHidden(true)) {
                        Image(systemName: "star.fill").font(.title)
                    }
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
