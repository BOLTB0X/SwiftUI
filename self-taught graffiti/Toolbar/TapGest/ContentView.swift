//
//  ContentView.swift
//  TapGest
//
//  Created by lkh on 11/20/23.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      VStack {
        Text("Toolbar 예제")
          .padding()
      }
      .navigationTitle("타이틀")
      .navigationBarTitleDisplayMode(.inline)

      .toolbar {
          ToolbarItemGroup(placement: .automatic) { // <-
          Button("First") {
            print("tap first button")
          }
          Button("Second") {
            print("tap second button")
          }
        }
          ToolbarItem(placement: .navigationBarLeading) {
              Button(action: { withAnimation {  } }) {
                  Image(systemName: "xmark").foregroundColor(.black)
              }
          }
          
          ToolbarItem(placement: .navigationBarTrailing) {
              Button("!") {
                  
              }
          }
      }
    }
  }
}

#Preview {
    ContentView()
}
