//
//  ContentView.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State private var hours = "00"
        @State private var minutes = "00"
        @State private var seconds = "00"
    
    var body: some View {
        CustomTextField(text: $hours)
//        HStack {
//            CustomTextField(text: $hours)
//            Text(":")
//            CustomTextField(text: $minutes)
//            Text(":")
//            CustomTextField(text: $seconds)
//        }

        //TwoDigitInputView()
        //inputTextField()
//        VStack {
//            Picker("Minutes", selection: $selectedMinutes) {
//                ForEach(0 ..< 60) {
//                    Text("\($0) min")
//                }
//            }
//            .pickerStyle(WheelPickerStyle())
//            
//            Picker("Seconds", selection: $selectedSeconds) {
//                ForEach(0 ..< 60) {
//                    Text("\($0) sec")
//                }
//            }
//            .pickerStyle(WheelPickerStyle())
//            
//            HStack {
//                TextField("Minutes", text: $textMinutes)
//                    .keyboardType(.numberPad)
//                    .onReceive(Just(textMinutes)) { input in
//                        if let minutes = Int(input) {
//                            selectedMinutes = minutes
//                        }
//                    }
//                
//                TextField("Seconds", text: $textSeconds)
//                    .keyboardType(.numberPad)
//                    .onReceive(Just(textSeconds)) { input in
//                        if let seconds = Int(input) {
//                            selectedSeconds = seconds
//                        }
//                    }
//            }
//        }
    }
}

#Preview {
    ContentView()
}
