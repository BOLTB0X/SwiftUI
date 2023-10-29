//
//  CustomTextField.swift
//  DummyProject
//
//  Created by lkh on 10/29/23.
//

import SwiftUI
import UIKit

struct CustomTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.delegate = context.coordinator
        textField.tintColor = .clear // 커서를 숨깁니다.
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(_ parent: CustomTextField) {
            self.parent = parent
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            // Check if the new string is numeric and contains only two characters
            let numericCharacterSet = CharacterSet(charactersIn: "0123456789")
            if string.rangeOfCharacter(from: numericCharacterSet.inverted) == nil && string.count <= 2 {
                // Combine the new string with the existing text
                let newText = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
                parent.text = newText
                return false
            }
            return false
        }
    }
}


