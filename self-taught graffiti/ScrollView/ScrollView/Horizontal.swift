//
//  Horizontal.swift
//  ScrollView
//
//  Created by KyungHeon Lee on 2023/02/15.
//

import SwiftUI

struct Horizontal: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content:  {
            HStack {
                ForEach(0..<50) { index in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100)
                        .overlay(Text("horizontal").foregroundColor(.white))
                }
            }
        })
        
    }
}

struct Horizontal_Previews: PreviewProvider {
    static var previews: some View {
        Horizontal()
    }
}
