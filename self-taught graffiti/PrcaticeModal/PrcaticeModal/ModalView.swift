//
//  ModalView.swift
//  PrcaticeModal
//
//  Created by KyungHeon Lee on 2023/03/07.
//

import SwiftUI

struct ModalView: View {
    // 되돌아가기 view 적용 -> dismiss
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss() }) {
                    Text("뒤로가기")
                }
            Text("ModalView")
            }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
