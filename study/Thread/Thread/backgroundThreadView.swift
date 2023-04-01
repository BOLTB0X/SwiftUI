//
//  backgroundThreadView.swift
//  Thread
//
//  Created by KyungHeon Lee on 2023/04/01.
//

import SwiftUI

struct backgroundThreadView: View {
//    @StateObject var bvm = MainThreadViewModel()
    @StateObject var bvm = BackgroundThreadViewModel()

    
    var body: some View {
        ScrollView{
            LazyVStack() {
                Text("Background Thread")
                    .font(Font.title.bold())
                    .onTapGesture {
                        bvm.fetchData()
                    }
                
                ForEach(bvm.dataArray, id: \.self) { data in
                    Text(data)
                        .font(.headline)
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct backgroundThreadView_Previews: PreviewProvider {
    static var previews: some View {
        backgroundThreadView()
    }
}
