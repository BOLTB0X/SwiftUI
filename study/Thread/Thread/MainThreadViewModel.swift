//
//  MainThreadViewModel.swift
//  Thread
//
//  Created by KyungHeon Lee on 2023/04/01.
//

import SwiftUI

class MainThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        let newData = downLoadData()
        dataArray = newData
    }
    
    // thread 작업을 확인하는 것이니 간단한 [String]으로 진행
    // private 선언하여 클래스 내에서만 액세스 할 수 있게끔 선언
    private func downLoadData() -> [String] {
        var data: [String] = []
        
        for i in 0..<50 {
            data.append("\(i)")
            print(data)
        }
        return data
    }
}
