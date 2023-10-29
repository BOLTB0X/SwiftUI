//
//  inputTextField.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI
import Combine

struct inputTextField: View {
    @State private var hours = "00"
    @State private var minutes = "00"
    @State private var seconds = "00"
    @FocusState private var hoursFocused: Bool
    @FocusState private var minutesFocused: Bool
    @FocusState private var secondsFocused: Bool
    
    var body: some View {
        HStack {
            TextField("HH", text: $hours)
                .focused($hoursFocused)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 50, height: 40)
                .font(.system(size: 20))
                .onReceive(Just(hours)) { newHours in
                    if newHours.count > 2 {
                         var newHours = newHours.map{String($0)}
                        let lastStr = newHours.last ?? "00"
                        newHours.removeLast()
                        hours = newHours.joined()
                        if (minutes == "00") {
                            hoursFocused = false
                            minutes = lastStr
                            minutesFocused = true
                        }
                    }
                }
            
            Text(":")
                .font(.system(size: 20))
            
            TextField("MM", text: $minutes)
                .focused($minutesFocused)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 50, height: 40)
                .font(.system(size: 20))
                .onReceive(Just(minutes)) { newMinutes in
                    
                    if newMinutes.count > 2 {
                        var newMinutes = newMinutes.map{String($0)}
                       let lastStr = newMinutes.last ?? "00"
                        newMinutes.removeLast()
                        minutes = newMinutes.joined()
                        if seconds == "00" {
                            minutesFocused = false
                            seconds = lastStr
                            secondsFocused = true
                        }
                    }
                }
            Text(":")
                .font(.system(size: 20))
            
            TextField("SS", text: $seconds)
                .focused($secondsFocused)
            
                .keyboardType(.numberPad)
                .textFieldStyle(PlainTextFieldStyle())
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.center)
                .frame(width: 50, height: 40)
                .font(.system(size: 20))
                .onReceive(Just(seconds)) { newSeconds in
                    if newSeconds.count > 2 {
                        var newSeconds = newSeconds.map { String($0)}
                        let lastStr = newSeconds.last ?? "00"
                        newSeconds.removeLast()
                        seconds = newSeconds.joined()
                    }
                }
        }
    }
}

#Preview {
    inputTextField()
}
