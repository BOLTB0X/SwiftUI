//
//  TimerView.swift
//  WorkoutLiveWidgetPOC
//
//  Created by KyungHeon Lee on 2024/04/24.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var timerManager = TimerManager.shared
    
    var body: some View {
        VStack {
            Text("Elapsed Time: \(formattedTime(timerManager.elapsedTime))")
                .padding()
            
            HStack {
                Button(action: {
                    timerManager.startTimer()
                }) {
                    Image(systemName: "play.circle")
                }
                
                Button(action: {
                    timerManager.pauseTimer()
                }) {
                    Image(systemName: "pause.circle")
                }
                
                Button(action: {
                    timerManager.stopTimer()
                }) {
                    Image(systemName: "stop.circle")
                }
            }
            .padding()
        }
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
