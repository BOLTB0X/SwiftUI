//
//  ContentView.swift
//  PrcaticeModal
//
//  Created by KyungHeon Lee on 2023/03/07.
//

import SwiftUI

struct ContentView: View {
    @State private var showsheet: Bool = false
    @State private var showfull: Bool = false
    
    var body: some View {
        VStack {
            // sheet 방식
            Button(action: {
                print("button pressed!")
                self.showsheet = true
            }) {
                Text("Show Modal Sheet!")
            }.sheet(isPresented: $showsheet) {
                ModalView()
            }
            
            // fullScreenCover
            Button(action: {
                print("button pressed!")
                self.showfull = true
            }) {
                Text("Show Modal FullScreenCover!")
            }.fullScreenCover(isPresented: $showfull) {
                ModalView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
