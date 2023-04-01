//
//  BackgroundThreadViewModel.swift
//  Thread
//
//  Created by KyungHeon Lee on 2023/04/01.
//

import SwiftUI

class BackgroundThreadViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func fetchData() {
        // background 실행을 위해ß
        DispatchQueue.global(qos: .background).async {
          
            let newData = self.downLoadData() // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함
            
            print("data를 처리하고 데이터를 이동, Thread 확인 1 : \(Thread.isMainThread)")
            print("data를 처리하고 데이터를 이동, Thread 확인 1 : \(Thread.current)")
            
            print("----------------------------------------------------------------")
            DispatchQueue.main.async {
                self.dataArray = newData // 클로저에서 속성 'dataArray'에 대한 참조는 캡처 시맨틱을 명시적으로 만들기 위해 'self'를 명시적으로 사용해야 함
                print("data update, Thread 확인 2 : \(Thread.isMainThread)")
                print("data update, Thread 확인 2 : \(Thread.current)")
            }

        }
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
