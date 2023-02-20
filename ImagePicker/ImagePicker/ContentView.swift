//
//  ContentView.swift
//  ImagePicker
//
//  Created by KyungHeon Lee on 2023/02/20.
//

import SwiftUI

struct ContentView: View {
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        HStack {
                    Image(uiImage: self.image)
                  .resizable()
                  .cornerRadius(50)
                  .frame(width: 100, height: 100)
                  .background(Color.black.opacity(0.2))
                  .aspectRatio(contentMode: .fill)
                  .clipShape(Circle())

         Text("Change photo")
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .cornerRadius(16)
            .foregroundColor(.black)
                .padding(.horizontal, 20)
                .onTapGesture {
                   showSheet = true
                 }
            }
        .padding(.horizontal, 20)
        .sheet(isPresented: $showSheet) {
                    // Pick an image from the photo library:
                ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)

                    //  If you wish to take a photo from camera instead:
                    // ImagePicker(sourceType: .camera, selectedImage: self.$image)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
