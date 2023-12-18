//
//  WidgetCircleTimerView.swift
//  ActivityKit_Tutorial
//
//  Created by lkh on 12/18/23.
//

import SwiftUI

struct WidgetCircleTimerView: View {
    var progress: Double
    var duration: String

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.25)
                .foregroundColor(.white)
                .frame(width: 36, height: 36)

            Circle()
                .trim(from: 0.0, to: progress)
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                .rotationEffect(.degrees(270.0))
                .frame(width: 36, height: 36)
        }
    }
}

//#Preview {
//    WidgetCircleTimerView()
//}
