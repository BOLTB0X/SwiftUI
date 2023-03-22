//
//  ListView.swift
//  practiceAlamofire
//
//  Created by KyungHeon Lee on 2023/03/22.
//

import SwiftUI

struct ListView: View {
    var prdData: RandomUser
    
    let gradient: LinearGradient = {
        let colors: [Color] = [.orange, .pink, .purple, .red, .yellow, .blue, .cyan]
            return LinearGradient(gradient: Gradient(colors: [colors.randomElement()!, colors.randomElement()!]), startPoint: .center, endPoint: .topTrailing)
        }()
    
    init(_ prdData: RandomUser) {
        self.prdData = prdData
    }
    
    var body: some View {
        HStack {
            Image(systemName: "heart")
                .padding()
                .background(gradient)
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text("\(prdData.name.title). \(prdData.name.first)\(prdData.name.last)")
                Text("\(prdData.email)")
            }
            
        }
    }
}
