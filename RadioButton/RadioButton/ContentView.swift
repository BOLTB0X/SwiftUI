//
//  ContentView.swift
//  RadioButton
//
//  Created by KyungHeon Lee on 2023/02/20.
//

import SwiftUI

struct ContentView: View {
    @State var gender = ""
    
    var body: some View {
        HStack {
            Text("Gender").font(.headline)
            VStack{
                RadioButtonField(
                    id: "Male",
                    label: "Male",
                    color:.red,
                    bgColor: .blue,
                    isMarked: $gender.wrappedValue == "Male" ? true : false,
                    callback: { selected in
                        self.gender = selected
                        print("Selected Gender is: \(selected)")
                    }
                )
                RadioButtonField(
                    id: "Female",
                    label: "Female",
                    color:.red,
                    bgColor: .blue,
                    isMarked: $gender.wrappedValue == "Female" ? true : false,
                    callback: { selected in
                        self.gender = selected
                        print("Selected Gender is: \(selected)")
                    }
                )
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
