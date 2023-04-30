//
//  ContentView.swift
//  Timer
//
//  Created by KyungHeon Lee on 2023/01/26.
//

import SwiftUI

struct ContentView: View {
    let date = Date()
    @State var timeRemaining : Int = 100
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Text(convertSecondsToTime(timeInSeconds:timeRemaining))
                .font(.system(size: 50))
                .onReceive(timer) { _ in
                    timeRemaining -= 1
                }
        }
        .onAppear {
            calcRemain()
        }
    }
    
    
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let hours = timeInSeconds / 3600
        let minutes = (timeInSeconds - hours*3600) / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i:%02i", hours,minutes,seconds)
    }
    
    func calcRemain() {
        let calendar = Calendar.current
        let targetTime : Date = calendar.date(byAdding: .second, value: 3810, to: date, wrappingComponents: false) ?? Date()
        let remainSeconds = Int(targetTime.timeIntervalSince(date))
        self.timeRemaining = remainSeconds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
