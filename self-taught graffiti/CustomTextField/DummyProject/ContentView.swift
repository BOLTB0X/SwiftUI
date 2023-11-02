//
//  ContentView.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI

enum Field {
    case hour
    case minutes
    case seconds
}

struct ContentView: View {
    @State private var hour: String = ""
    @State private var minutes: String = ""
    @State private var seconds: String = ""
    @FocusState private var focusField: Field?
    
    var body: some View {
        VStack {
            TextField("hh", text: $hour)
                .focused($focusField, equals: .hour)
            
            TextField("mm", text: $minutes)
                .focused($focusField, equals: .minutes)
            
            TextField("ss", text: $seconds)
                .focused($focusField, equals: .seconds)
        }
        .padding()
        //CustomTextField(text: $hours)
    }
}

#Preview {
    ContentView()
}
