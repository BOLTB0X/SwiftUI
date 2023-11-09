//
//  FormItemRows.swift
//  FormDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

struct FormItemRow: View {
    var item: FormItem
    @State private var titleInput: String = ""
    @State private var questionInput: String = ""
    var subText: String
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                TextField("제목", text: $titleInput)
                    .textFieldStyle(.roundedBorder)
                TextField(subText, text: $questionInput)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            .shadow(radius: 5)
        }
    }
}

struct FormItemRow2: View {
    var item: FormItem
    @State private var titleInput: String = ""
    @State private var questionInput: String = ""
    var subText: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                TextField("제목", text: $titleInput)
                    .textFieldStyle(.roundedBorder)

                TextField(subText, text: $questionInput)
                    .textFieldStyle(.roundedBorder)
            }
            .padding()
            .shadow(radius: 5)
        }
    }
}

struct FormItemRow3: View {
    @State private var selectedOption: Int = 1

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                RadioButton(index: 1, selectedIndex: $selectedOption)
                RadioButton(index: 2, selectedIndex: $selectedOption)
                RadioButton(index: 3, selectedIndex: $selectedOption)
            }
            .padding()
            .shadow(radius: 5)
        }
    }
}
