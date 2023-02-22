//
//  PastAlertView.swift
//  Alert
//
//  Created by KyungHeon Lee on 2023/02/22.
//

import SwiftUI

struct PastAlertView: View {
    // 과거 Alert의 쓰임새
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Text("클릭")
                .foregroundColor(.black)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("제목"), message: Text("알림 메세지"), dismissButton: .default(Text("취소")))
        }
    }
}

struct PastAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PastAlertView()
    }
}
