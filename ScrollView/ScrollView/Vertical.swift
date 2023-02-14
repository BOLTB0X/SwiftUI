//
//  Vertical.swift
//  ScrollView
//
//  Created by KyungHeon Lee on 2023/02/15.
//

import SwiftUI

struct Vertical: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:  {
            VStack {
                ForEach(0..<50) { index in
                    Circle()
                        .fill(Color.red)
                        .frame(height: 100)
                        .overlay(Text("vertical").foregroundColor(.white))
                }
            }
        })
    }
}

struct Vertical_Previews: PreviewProvider {
    static var previews: some View {
        Vertical()
    }
}
