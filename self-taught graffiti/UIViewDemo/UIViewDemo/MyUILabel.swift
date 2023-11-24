//
//  MyUILabel.swift
//  UIViewDemo
//
//  Created by lkh on 11/24/23.
//

import SwiftUI

struct MyUILabel: UIViewRepresentable {
    var text: String
    
    func makeUIView(context: UIViewRepresentableContext<MyUILabel>) -> UILabel {
        let myLabel = UILabel()
        myLabel.text = text
        return myLabel
    }
    
    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<MyUILabel>) {
        }
}

#Preview {
    MyUILabel(text: "오오오오오오오")
}
