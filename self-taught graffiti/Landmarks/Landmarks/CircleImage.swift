//
//  CircleImage.swift
//  Landmarks
//
//  Created by KyungHeon Lee on 2023/02/05.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("dog") // 이미지를
            .frame(width: 500, height: 500)
            .clipShape(Circle()) // 원형으로
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
