//
//  ContentView.swift
//  practiceAlamofire
//
//  Created by KyungHeon Lee on 2023/03/22.
//

import SwiftUI

// 주석 및 추가예정
struct ContentView: View {
    @ObservedObject var vm = ViewModel()
    let url = "https://randomuser.me/api/?results=50&inc=name,email"
    
    init() {
        vm.alamofireNetworking(url: url)
    }
    
    var body: some View {
        List(vm.randomUser) { datas in
            ListView(datas)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
