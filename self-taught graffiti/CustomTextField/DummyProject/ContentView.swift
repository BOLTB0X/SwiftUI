//
//  ContentView.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI
import Combine
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
                .onChange(of: hour) { newValue in
                    if newValue.count > 1 && newValue.first! == "0" {
                        hour = "0"
                    }
                }
                .padding()
            //CustomTextField(text: $hours)
        }
    }
}

#Preview {
    ContentView()
}
