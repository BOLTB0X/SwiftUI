//
//  ContentView.swift
//  FormDemo
//
//  Created by lkh on 11/9/23.
//

import SwiftUI

enum QuestionType {
    case short
    case questions
    case radio
}

struct FormItem: Identifiable {
    let id = UUID()
    var type: QuestionType
    
    init(type: QuestionType) {
        self.type = type
    }
}

struct ContentView: View {
    @State private var titleInput: String = ""
    @State private var surveyItems: [FormItem] = []
    @State private var addBtn: Bool = false

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    TextField("제목", text: $titleInput)
                        .textFieldStyle(.roundedBorder)
                        .font(.largeTitle)
                        .shadow(radius: 5)

                
                    ForEach(surveyItems) { item in
                        switch item.type {
                        case .short:
                            FormItemRow(item: item, subText: "단답형 답변")
                        case .questions:
                            FormItemRow2(item: item, subText: "질문형 답변")
                        case .radio:
                            FormItemRow3()
                        }
                    }
                }
            }
            .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    addBtn.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 70, height: 70)
                }
            }
            .padding()
        }
        .actionSheet(isPresented: $addBtn, content: {
            ActionSheet(title: Text("종류"), message: Text("설문 항목 추가"), buttons: [
                .default(Text("단답형 폼 추가"), action: {
                    let newItem = FormItem(type: .short)
                    surveyItems.append(newItem)
                }),
                .default(Text("질문형 폼 추가"), action: {
                    let newItem = FormItem(type: .questions)
                    surveyItems.append(newItem)
                }),
                .default(Text("체크 폼 추가"), action: {
                    let newItem = FormItem(type: .radio)
                    surveyItems.append(newItem)
                }),
                .cancel(Text("Cancel"))
            ])
        })
    }
}


#Preview {
    ContentView()
}
