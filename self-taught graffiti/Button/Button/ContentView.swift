//
//  ContentView.swift
//  Button
//
//  Created by KyungHeon Lee on 2023/01/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image(systemName: "pencil")
                Text("Button")
            } .font(.system(size: 60))
            .foregroundColor(.black)
        }.padding()
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(40)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
