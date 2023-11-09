//
//  RadioButton.swift
//  FormDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

struct RadioButton: View {
    var index: Int
    @Binding var selectedIndex: Int
    
    var body: some View {
        Button(action: {
            selectedIndex = index
        }) {
            HStack {
                Image(systemName: selectedIndex == index ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(.black)
                Text("Option \(index)")
            }
        }
    }
}

