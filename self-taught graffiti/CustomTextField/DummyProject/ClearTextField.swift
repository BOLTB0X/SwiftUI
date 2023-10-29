//
//  ClearTextField.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI
import Combine

struct ClearTextField: View {
    @State var time: String = ""

    var body: some View {
        TextField("Time", text: $time)
            .textFieldStyle(.roundedBorder)
            .textContentType(.none)
            .keyboardType(.numberPad)
            .onChange(of: time) { newValue in
                time = formatTimeInput(newValue)
            }
    }

    private func formatTimeInput(_ input: String) -> String {
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")

        // Remove non-numeric characters
        let numericString = input.components(separatedBy: allowedCharacterSet.inverted).joined()

        // Limit the input to 4 digits
        let limitedString = String(numericString.prefix(4))

        // Insert colons at appropriate positions (e.g., 2230 -> 22:30)
        let formattedString: String
        if limitedString.count > 2 {
            let index = limitedString.index(limitedString.startIndex, offsetBy: 2)
            let hour = limitedString[..<index]
            let minute = limitedString[index...]
            formattedString = "\(hour):\(minute)"
        } else {
            formattedString = limitedString
        }

        return formattedString
    }
}

#Preview {
    ClearTextField()
}
