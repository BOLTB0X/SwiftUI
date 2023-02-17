//
//  ContentView.swift
//  PracticeAVFoundation
//
//  Created by KyungHeon Lee on 2023/02/16.
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        VStack {
            FrameView(image: nil)
              .edgesIgnoringSafeArea(.all) // 세이프 처리
            
            ErrorView(error: model.error)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
