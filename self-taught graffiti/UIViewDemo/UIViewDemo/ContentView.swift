//
//  ContentView.swift
//  UIViewDemo
//
//  Created by lkh on 11/24/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var imagePickerVisible: Bool = false
    @State var selectedImage: Image? = Image(systemName: "photo")

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            // MyScrollView 사용하기
            MyScrollView(text: "UIView in SwiftUI")
            
            MyUILabel(text: "오오오오오오오")
            
            ZStack {
                VStack {
                    selectedImage?
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                    Button(action: {
                        withAnimation {
                            self.imagePickerVisible.toggle()
                        }
                    }) {
                        Text("Select an Image")
                    }
                    
                }.padding()
                
                if (imagePickerVisible) {
                    MyImagePicker(imagePickerVisible:
                                    $imagePickerVisible,
                                       selectedImage: $selectedImage)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
