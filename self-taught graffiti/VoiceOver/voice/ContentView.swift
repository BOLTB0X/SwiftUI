//
//  ContentView.swift
//  voice
//
//  Created by lkh on 12/10/23.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @State private var textToSpeak = "Hello, this is a test."

    var body: some View {
        VStack {
            Text("Text to Speak:")
            TextField("Enter text", text: $textToSpeak)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Speak") {
                speakText()
            }
        }
        .padding()
    }

    func speakText() {
        let synthesizer = AVSpeechSynthesizer()
        let utterance = AVSpeechUtterance(string: textToSpeak)
        utterance.voice = AVSpeechSynthesisVoice(identifier: "com.apple.ttsbundle.speech.voice.Samantha-premium")
        synthesizer.speak(utterance)
    }
}

#Preview {
    ContentView()
}
