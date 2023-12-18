//
//  ContentView.swift
//  ActivityKit_Tutorial
//
//  Created by lkh on 12/18/23.
//

import SwiftUI
import ActivityKit

class TimerViewModel: ObservableObject {
    @Published var secondElapsed: Double = 0
}

struct ContentView: View {
    @StateObject private var viewModel = TimerViewModel()
    @State private var timer: Timer? = nil
    @State var activity: Activity<TimerAttributes>?
    @State var duration: TimeInterval = 2 * 60
    @State var progress = 1.0
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text(timeString(viewModel.secondElapsed))
                .font(.title)
            
            timerControl()
        }
    }
    
    // MARK: - @ViewBuilders
    // ...
    // MARK: - timerControl
    @ViewBuilder
    private func timerControl() -> some View {
        HStack(alignment: .center, spacing: 0) {
            Button("시작") {
                startTimer()
            }
            Spacer()
            Button("정지") {
                stopTimer()
            }
        }
        .padding()
    }
    // MARK: - methods
    // ...
    // MARK: - startTimer
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            viewModel.secondElapsed += 0.01
        }
//        activity = LiveActivityManager().startActivity(duration: duration, progress: progress)

    }
    
    // MARK: - stopTimer
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - timeString
    func timeString(_ millisecond: Double) -> String {
        let secondElapsed = (Int(millisecond) % 1000) % 60
        let minuteElapsed = ((Int(millisecond) % 1000) / 60) % 60
        return String(format: "%02d:%02d.%02d", minuteElapsed, secondElapsed, Int(millisecond * 100) % 100 )
    }
}

extension TimeInterval {
    func format(using units: NSCalendar.Unit) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = units
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: self) ?? ""
    }
}

#Preview {
    ContentView()
}
