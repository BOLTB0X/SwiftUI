//
//  CurrentAlertView.swift
//  Alert
//
//  Created by KyungHeon Lee on 2023/02/22.
//

import SwiftUI

struct CurrentAlertView: View {
    @State private var showing = false
    
    var body: some View {
        Button("클릭") {
            showing = true
        }
        .alert("제목", isPresented: $showing) {
          Button("취소", role: .cancel) { }
        }
    }
}

struct CurrentAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentAlertView()
    }
}
