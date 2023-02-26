//
//  ScrollViewInScrollView.swift
//  ScrollView
//
//  Created by KyungHeon Lee on 2023/02/15.
//

import SwiftUI

struct ScrollViewInScrollView: View {
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<20) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack {
                            ForEach(0..<10)  { _ in
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
    }
}

struct ScrollViewInScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewInScrollView()
    }
}
